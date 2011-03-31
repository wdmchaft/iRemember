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

-(void)save{
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentDirectory = [paths objectAtIndex:0];
	NSString* fullPath = [NSString stringWithFormat:@"%@/%@",documentDirectory,@"library"];
	
	NSMutableData* data = [[NSMutableData alloc] init];
	NSKeyedArchiver* arc = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[arc encodeObject:[libraries objectAtIndex:0] forKey:@"indonesian"];
	[arc finishEncoding];
	BOOL success = [data writeToFile:fullPath atomically:YES];
	[arc release];
	[data release];
	if(!success) NSLog(@"Unsuccessful!");
}

-(void)load{
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentDirectory = [paths objectAtIndex:0];
	NSString* fullPath = [NSString stringWithFormat:@"%@/%@",documentDirectory,@"library"];
	NSMutableData* data = [NSData dataWithContentsOfFile:fullPath];
	NSKeyedUnarchiver* unarc = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
	IRLibrary* library = [unarc decodeObjectForKey:@"indonesian"];
	[unarc finishDecoding];
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
