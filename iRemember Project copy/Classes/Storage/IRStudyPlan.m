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

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	[wordList updateStatisticsWithList:list inGame:gameName];
}

-(void)dealloc{
	[wordList release];
	[plannedReviewDates release];
	[actualReviewDates release];
	[super dealloc];
}

@end
