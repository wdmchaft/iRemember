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

-(id)init{
	return [self initWithID:0];
}

-(id)initWithID:(NSInteger)wordId{
	if([super init]!=nil){
		wordID = wordId;
		reviewDates = [[NSMutableArray alloc] init];
		isStudied = NO;
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder*)coder{
	[coder encodeInteger:wordID forKey:@"wordID"];
	[coder encodeObject:reviewDates forKey:@"reviewDates"];
	[coder encodeBool:isStudied forKey:@"isStudied"];
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil){
		[self setWordID:[decoder decodeIntegerForKey:@"wordID"]];
		[self setReviewDates:[decoder decodeObjectForKey:@"reviewDates"]];
		[self setIsStudied:[decoder decodeBoolForKey:@"isStudied"]];
	}
	return self;
}

-(void)dealloc{
	[reviewDates release];
	[super dealloc];
}

@end
