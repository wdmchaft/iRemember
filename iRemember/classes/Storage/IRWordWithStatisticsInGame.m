//
//  WordWithStatisticsInGame.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRWordWithStatisticsInGame.h"


@implementation IRWordWithStatisticsInGame

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

-(void)updateStatWithStat:(IRWordWithStatisticsInGame *)word{
	[self setCorrectCount:[self correctCount]+[word correctCount]];
	[self setIncorrectCount:[self incorrectCount]+[word incorrectCount]];
	[self setTotalReactionTime:[self totalReactionTime]+[word totalReactionTime]];
}

-(void)dealloc{
	[super dealloc];
}

@end
