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
@synthesize numberOfWordsForReview, defaultGameName, studyOrdering ;

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
		defaultGameName = GAME_MCQ;
		studyOrdering = IRStudyOrderingAlphabetical;
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
		if([wordWithStat incorrectCount]>[wordWithStat correctCount]){
			[result addObject:[wordList wordWithID:[wordWithStat wordID]]];
		}
	}
	return [result autorelease];
}

-(void)setUpReviewDatesWithMode:(IRStudyMode)mode{
	int i=0;
	switch(mode){
		case IRStudyModeDaily:
		case IRStudyModeDefault:
			for(i=0; i<totalDay; i++){
				NSDate* date = [NSDate dateWithTimeInterval:dayToSecond(i+1) sinceDate:[NSDate date]];
				[plannedReviewDates addObject:date];
			}
			break;
		case IRStudyModeWeekly:
			for(i=0; i<totalDay; i++){
				NSDate* date = [NSDate dateWithTimeInterval:dayToSecond(7*i+1) sinceDate:[NSDate date]];
				[plannedReviewDates addObject:date];
			}
			break;
		case IRStudyModeEbenhause:
			for(i=0; i<totalDay; i++){
				NSDate* date = [NSDate dateWithTimeInterval:dayToSecond(i+1+(i/4)) sinceDate:[NSDate date]];
				[plannedReviewDates addObject:date];
			}
			break;
	}
}

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	[wordList updateStatisticsWithList:list inGame:gameName];
}

-(void)didReviewAtDate:(NSDate*)date{
	[actualReviewDates addObject:date];
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
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil){
		[self setName:[decoder decodeObjectForKey:@"name"]];
		[self setWordList:[decoder decodeObjectForKey:@"wordList"]];
		[self setPlannedReviewDates:[decoder decodeObjectForKey:@"plannedReviewDates"]];
		[self setActualReviewDates:[decoder decodeObjectForKey:@"actualReviewDates"]];
		[self setElapsedDay:[decoder decodeIntegerForKey:@"elapsedDay"]];
	}
	return self;
}

-(void)dealloc{
	[name release];
	[wordList release];
	[plannedReviewDates release];
	[actualReviewDates release];
	[reviewAlertTime release];
	[super dealloc];
}

@end
