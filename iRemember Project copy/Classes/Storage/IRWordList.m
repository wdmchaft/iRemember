//
//  IRWordList.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRWordList.h"
#import <string.h>

@implementation IRWordList

@synthesize listName, wordsWithStatistics, wordsWithStatisticsInGame;

CFComparisonResult compareWordsWithStatisticsInGame(const void* val1, const void* val2, void* context){
	IRWordWithStatisticsInGame* stat1 = (IRWordWithStatisticsInGame*)val1;
	IRWordWithStatisticsInGame* stat2 = (IRWordWithStatisticsInGame*)val2;
	if([stat1 wordID]>[stat2 wordID]) return 1;
	else if([stat1 wordID]<[stat2 wordID]) return -1;
	return 0;
}

-(NSArray*)studied{
	NSMutableArray* result = [[NSMutableArray alloc] init];
	int i=0;
	for(i=0; i<[wordsWithStatistics count]; i++){
		IRWordWithStatistics* wordTaken = [wordsWithStatistics objectAtIndex:i];
		if([wordTaken isStudied]){
			[result addObject:[self wordWithID:[wordTaken wordID]]];
		}
	}
	return [result autorelease];
}

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName{
	NSMutableArray* gameStatistics = [wordsWithStatisticsInGame objectForKey:gameName];
	if(gameStatistics==nil){
		gameStatistics = [[NSMutableArray alloc] init];
		[wordsWithStatisticsInGame setObject:gameStatistics forKey:gameName];
	}
	int i=0;
	for(i=0; i<[list count]; i++){
		IRWordWithStatisticsInGame* currentWord = [list objectAtIndex:i];
		NSInteger insertIndex = (NSInteger)CFArrayBSearchValues((CFArrayRef)gameStatistics,
																CFRangeMake(0, CFArrayGetCount((CFArrayRef)gameStatistics)),
																currentWord,
																(CFComparatorFunction)compareWordsWithStatisticsInGame,
																NULL);
		if([[gameStatistics objectAtIndex:insertIndex] wordID]!=[currentWord wordID]){
			[gameStatistics insertObject:[list objectAtIndex:i] atIndex:insertIndex];
		} else {
			[gameStatistics replaceObjectAtIndex:insertIndex withObject:currentWord];
		}
	}
}

@end
