//
//  StudyPlan.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRStudyPlan.h"


@implementation IRStudyPlan

@synthesize name, wordsWithStatistics, plannedReviewDates, actualReviewDates, wordsWithStatisticsInGame, elapsedDay;

-(void)dealloc{
	[wordsWithStatistics release];
	[plannedReviewDates release];
	[actualReviewDates release];
	[wordsWithStatistics release];
	[super dealloc];
}

@end
