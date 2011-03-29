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

@synthesize libraries;

+(id)currentState{
	if(currentState==nil) currentState = [[IRAppState alloc] init];
	return currentState;
}

-(void)setWordsForGameWithMode:(GameStartMode)mode{
	return;
}

-(IRWordList*)wordsForGame{
	return [[[IRWordList alloc] init] autorelease];
}

@end
