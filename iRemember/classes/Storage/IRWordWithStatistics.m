//
//  WordWithStatistics.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRWordWithStatistics.h"


@implementation IRWordWithStatistics

@synthesize wordID, reviewDates, isStudied;

-(id)initWithID:(NSInteger)id{
	if([super init]!=nil){
		[self setWordID:id];
		[self setReviewDates: [[NSArray alloc] init]];
		[self setIsStudied: NO];
	}
	return self;
}

-(void)dealloc{
	[reviewDates release];
	[super dealloc];
}

@end
