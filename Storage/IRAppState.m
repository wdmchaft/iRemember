//
//  AppState.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRAppState.h"
#import "IRHeader.h"

static IRAppState* currentState;

@implementation IRAppState

@synthesize libraries, currentStudyPlan;

+(id)currentState{
	if(currentState==nil) currentState = [[IRAppState alloc] init];
	return currentState;
}

-(void)setWordsForGameWithMode:(GameStartMode)mode{
	switch(mode){
		case kGameStartAll:
			wordsForGame = [[[currentStudyPlan wordList] words] copy];
			break;
		case kGameStartStudied:
			wordsForGame = [[[currentStudyPlan wordList] studied] copy];
			break;
	}			
	return;
}

-(NSArray*)wordsForGame{
	return [wordsForGame autorelease];
}

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	[currentStudyPlan updateStatisticsWithList:list inGame:gameName];
}

@end
