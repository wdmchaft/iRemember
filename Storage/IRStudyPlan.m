//
//  StudyPlan.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRStudyPlan.h"
#import "IRHeader.h"

@implementation IRStudyPlan

@synthesize name, wordList, plannedReviewDates, actualReviewDates, elapsedDay, totalDay, reviewAlertTime;
@synthesize numberOfWordsForReview, defaultGameName, studyOrdering, reviewInterval, ebenhauseMode;

NSTimeInterval dayToSecond(int days){
	return days*24*60*60;
}

-(id)init{
	return [self initWithName:DEFAULT_STUDYPLAN wordList:[[[IRWordList alloc] init] autorelease]];
}

-(id)initWithName:(NSString*)nam wordList:(IRWordList*)list{
	if([super init]!=nil){
		[self setName:nam];
		[self setWordList:list];
		plannedReviewDates = [[NSMutableArray alloc] init];
		actualReviewDates = [[NSMutableArray alloc] init];
		[self setElapsedDay:0];
		[self setTotalDay:DEFAULT_TOTAL_DAYS];
		NSDateComponents* time = [[NSDateComponents alloc] init];
		[time setHour:DEFAULT_HOUR];
		[time setMinute:DEFAULT_MINUTE];
		[self setReviewAlertTime:time];
		[time release];
		
		numberOfWordsForReview = 5;
		[self setDefaultGameName:GAME_MCQ];
		studyOrdering = IRStudyOrderingAlphabetical;
		reviewInterval = 1;
		ebenhauseMode = NO;
	}
	return self;
}

-(NSString*)language{
	return [wordList language];
}

-(void)setLanguage:(NSString*)lang{
	[[self wordList] setLanguage:lang];
}

-(IRWord*)addWord:(NSString *)eng translation:(NSString *)trans lang:(NSString *)lang{
	return [wordList addWord:eng translation:trans lang:lang];
}

-(NSArray*)addWordsInList:(NSArray*)list{
	return [wordList addWords:list];
}

-(NSArray*)difficultWords{
	NSMutableArray* result = [[NSMutableArray alloc] init];
	int i=0;
	NSArray* words = [wordList statisticsOverview];
	for(i=0; i<[words count]; i++){
		IRWordWithStatisticsInGame* wordWithStat = [words objectAtIndex:i];
		if([wordWithStat incorrectCount]>[wordWithStat correctCount]+1){
			[result addObject:[wordList wordWithID:[wordWithStat wordID]]];
		}
	}
	return [result autorelease];
}

-(NSArray*)wordsForStudy{
	int wordsPerDay = ([wordList count]/totalDay)+1;
	NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:wordsPerDay];
	int i=0,j=0;
	NSArray* unstudied = [wordList unstudiedWords];
	int used[[unstudied count]];
	int size = [unstudied count];
	for(i=0; i<[unstudied count]; i++){
		used[i] = i;
	}
	switch(studyOrdering){
		case IRStudyOrderingAlphabetical:
			for(i=0; i<wordsPerDay && i<[unstudied count]; i++){
				[result addObject:[wordList wordWithID:[[unstudied objectAtIndex:i] wordID]]];
			}
			break;
		case IRStudyOrderingReversed:
			for(i=[unstudied count]-1; i>=[unstudied count]-wordsPerDay && i>=0; i--){
				[result addObject:[wordList wordWithID:[[unstudied objectAtIndex:i] wordID]]];
			}
			break;
		case IRStudyOrderingRandom:
			for(i=0; i<wordsPerDay && i<[unstudied count]; i++){
				int idx = rand()*size;
				[result addObject:[wordList wordWithID:[[unstudied objectAtIndex:used[idx]] wordID]]];
				for(j=idx; j<size-1; j++){
					used[j]=used[j+1];
				}
				size--;
			}
			break;
	}
	return [result autorelease];
}

-(void)setReviewInterval:(NSInteger)interval{
	reviewInterval = interval;
	[self setupReviewDates];
}

-(void)setupReviewDates{
	int i=0;
	NSDateComponents* base = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit) fromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
	[base setHour:0];
	[base setMinute:0];
	NSDate* date = [[NSCalendar currentCalendar] dateFromComponents:base];
	NSDateComponents* diff = [[NSDateComponents alloc] init];
	[diff setHour:[reviewAlertTime hour]];
	[diff setMinute:[reviewAlertTime minute]];
	if(!ebenhauseMode){
		for(IRWordWithStatistics* word in [wordList wordsWithStatistics]){
			int con = [word numberOfConductedReview];
			if([[word reviewDates] count]>0 && [(NSDate*)[[word reviewDates] objectAtIndex:con] compare:date]>=0){
				for(i=0; i<NUMBER_REVIEW-con; i++){
					NSDate* newDate = [[word reviewDates] objectAtIndex:i+con];
					if(![plannedReviewDates containsObject:newDate]) [plannedReviewDates addObject:newDate];
				}
				continue;
			}
			for(i=0; i<NUMBER_REVIEW-con; i++){
				[diff setDay:reviewInterval*i+1];
				NSDate* newDate = [[NSCalendar currentCalendar] dateByAddingComponents:diff toDate:date options:0];
				if(i+con<[[word reviewDates] count]){
					[[word reviewDates] replaceObjectAtIndex:i+con withObject:newDate];
				}else{
					[[word reviewDates] addObject:newDate];
				}
				if(![plannedReviewDates containsObject:newDate]) [plannedReviewDates addObject:newDate];
			}
		}
	} else {
		for(IRWordWithStatistics* word in [wordList wordsWithStatistics]){
			int con = [word numberOfConductedReview];
			if([[word reviewDates] count]>0 && [(NSDate*)[[word reviewDates] objectAtIndex:con] compare:date]>=0){
				for(i=0; i<NUMBER_REVIEW-con; i++){
					NSDate* newDate = [[word reviewDates] objectAtIndex:i+con];
					if(![plannedReviewDates containsObject:newDate]) [plannedReviewDates addObject:newDate];
				}
				continue;
			}
			for(i=0; i<NUMBER_REVIEW-con; i++){
				[diff setDay:i*((3*i)/(i+2))-con*((3*con)/(con+2))+1];
				NSDate* newDate = [[NSCalendar currentCalendar] dateByAddingComponents:diff toDate:date options:0];
				if(i+con<[[word reviewDates] count]){
					[[word reviewDates] replaceObjectAtIndex:i+con withObject:newDate];
				}else{
					[[word reviewDates] addObject:newDate];
				}
				if(![plannedReviewDates containsObject:newDate]) [plannedReviewDates addObject:newDate];
			}
		}
	}
	[diff release];
}

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	[wordList updateStatisticsWithList:list inGame:gameName];
}

-(BOOL)isEqual:(IRStudyPlan*)sp{
	if(self==nil || sp==nil) return NO;
	else
	{
		return [self.name isEqual:sp.name];
	}
}

-(void)encodeWithCoder:(NSCoder*)coder{
	[coder encodeObject:name forKey:@"name"];
	[coder encodeObject:wordList forKey:@"wordList"];
	[coder encodeObject:plannedReviewDates forKey:@"plannedReviewDates"];
	[coder encodeObject:actualReviewDates forKey:@"actualReviewDates"];
	[coder encodeInteger:elapsedDay forKey:@"elapsedDay"];
	[coder encodeInteger:totalDay forKey:@"totalDay"];
	[coder encodeObject:reviewAlertTime forKey:@"reviewAlertTime"];
	[coder encodeInteger:numberOfWordsForReview forKey:@"numberOfWordsForReview"];
	[coder encodeObject:defaultGameName forKey:@"defaultGameName"];
	[coder encodeInteger:studyOrdering forKey:@"studyOrdering"];
	[coder encodeInteger:reviewInterval forKey:@"reviewInterval"];
	[coder encodeBool:ebenhauseMode forKey:@"ebenhauseMode"];
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil){
		[self setName:[decoder decodeObjectForKey:@"name"]];
		[self setWordList:[decoder decodeObjectForKey:@"wordList"]];
		[self setPlannedReviewDates:[decoder decodeObjectForKey:@"plannedReviewDates"]];
		[self setActualReviewDates:[decoder decodeObjectForKey:@"actualReviewDates"]];
		[self setElapsedDay:[decoder decodeIntegerForKey:@"elapsedDay"]];
		[self setTotalDay:[decoder decodeIntegerForKey:@"totalDay"]];
		[self setReviewAlertTime:[decoder decodeObjectForKey:@"reviewAlertTime"]];
		[self setNumberOfWordsForReview:[decoder decodeIntegerForKey:@"numberOfWordsForReview"]];
		[self setDefaultGameName:[decoder decodeObjectForKey:@"defaultGameName"]];
		[self setStudyOrdering:[decoder decodeIntegerForKey:@"studyOrdering"]];
		[self setReviewInterval:[decoder decodeIntegerForKey:@"reviewInterval"]];
		[self setEbenhauseMode:[decoder decodeBoolForKey:@"ebenhauseMode"]];
	}
	return self;
}

-(void)dealloc{
	[name release];
	[wordList release];
	[plannedReviewDates release];
	[actualReviewDates release];
	[reviewAlertTime release];
	[defaultGameName release];
	[super dealloc];
}

@end
