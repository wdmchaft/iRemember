//
//  StudyPlan.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRStudyPlan.h"


@implementation IRStudyPlan

@synthesize name, wordList, plannedReviewDates, actualReviewDates, elapsedDay;

-(id)initWithName:(NSString*)nam wordList:(IRWordList*)list{
	if([super init]!=nil){
		[self setName:nam];
		[self setWordList:list];
		plannedReviewDates = [[NSMutableArray alloc] init];
		actualReviewDates = [[NSMutableArray alloc] init];
		[self setElapsedDay:0];
	}
	return self;
}

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	[wordList updateStatisticsWithList:list inGame:gameName];
}

-(void)encodeWithCoder:(NSCoder*)coder{
	[coder encodeObject:name forKey:@"name"];
	[coder encodeObject:plannedReviewDates forKey:@"plannedReviewDates"];
	[coder encodeObject:actualReviewDates forKey:@"actualReviewDates"];
	[coder encodeInteger:elapsedDay forKey:@"elapsedDay"];
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil){
		[self setName:[decoder decodeObjectForKey:@"name"]];
		[self setPlannedReviewDates:[decoder decodeObjectForKey:@"plannedReviewDates"]];
		[self setActualReviewDates:[decoder decodeObjectForKey:@"actualReviewDates"]];
		[self setElapsedDay:[decoder decodeIntegerForKey:@"elapsedDay"]];
	}
	return self;
}

-(void)dealloc{
	[wordList release];
	[plannedReviewDates release];
	[actualReviewDates release];
	[super dealloc];
}

@end
