//
//  WordWithStatistics.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WordWithStatistics.h"


@implementation WordWithStatistics

@synthesize wordID, reviewDates, isStudied;

-(void)dealloc{
	[reviewDates release];
	[super dealloc];
}

@end
