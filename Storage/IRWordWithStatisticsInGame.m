//
//  WordWithStatisticsInGame.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WordWithStatisticsInGame.h"


@implementation WordWithStatisticsInGame

@synthesize wordID, correctCount, incorrectCount, totalReactionTime;

-(NSInteger)usedCount{
	return correctCount+incorrectCount;
}

-(void)addTotalReactionTime:(NSInteger)time{
	totalReactionTime+=time;
}

-(CGFloat)getAverageReactionTime{
	return (CGFloat)totalReactionTime/[self usedCount];
}

-(void)dealloc{
	[super dealloc];
}

@end
