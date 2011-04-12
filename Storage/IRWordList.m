//
//  IRWordList.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRWordList.h"
#import "IRHeader.h"
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

-(id)init{
	return [self initWithLanguage:DEFAULT_LANGUAGE];
}

-(id)initWithLanguage:(NSString *)lang{
	return [self initWithLanguage:lang name:@"default"];
}

-(id)initWithLanguage:(NSString *)lang name:(NSString*)name{
	if([super initWithLanguage:lang]!=nil){
		[self setListName:name];
		wordsWithStatistics = [[NSMutableArray alloc] init];
		wordsWithStatisticsInGame = [[NSMutableDictionary alloc] init];
	}
	return self;
}

-(NSArray*)studiedWords{
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

-(NSArray*)unstudiedWords{
	NSMutableArray* result = [[NSMutableArray alloc] init];
	int i=0;
	for(i=0; i<[wordsWithStatistics count]; i++){
		IRWordWithStatistics* wordTaken = [wordsWithStatistics objectAtIndex:i];
		if(![wordTaken isStudied]){
			[result addObject:[self wordWithID:[wordTaken wordID]]];
		}
	}
	return [result autorelease];
}

-(IRWord*)addWord:(NSString *)eng translation:(NSString *)trans lang:(NSString *)lang{
	IRWord* added = [super addWord:eng translation:trans lang:lang];
	if(added!=nil){
		[wordsWithStatistics addObject:[[[IRWordWithStatistics alloc] initWithID:[added wordID]] autorelease]];
	}
	return added;
}

-(NSArray*)addWords:(NSArray *)wordList{
	NSArray* added = [super addWords:wordList];
	for(IRWord* word in added){
		[wordsWithStatistics addObject:[[[IRWordWithStatistics alloc] initWithID:[word wordID]] autorelease]];
	}
	return added;
}

-(NSArray*)statisticsInGame:(NSString *)gameName{
	return [wordsWithStatisticsInGame objectForKey:gameName];
}

-(NSArray*)statisticsOverview{
	NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:[self count]];
	for(NSArray* gameStatistics in [wordsWithStatisticsInGame allValues]){
		int i=0, idx=0;
		for(i=0; i<[gameStatistics count]; i++){
			IRWordWithStatisticsInGame* wordStat = [gameStatistics objectAtIndex:i];
			BOOL shouldAdd = YES;
			while(idx<[result count]){
				IRWordWithStatisticsInGame* curWord = [result objectAtIndex:idx];
				if([curWord wordID]==[wordStat wordID]){
					[curWord updateStatWithStat:wordStat];
					shouldAdd = NO;
					break;
				} else if([curWord wordID]>[wordStat wordID]){
					shouldAdd = YES;
					break;
				} else {
					idx++;
				}
			}
			if(shouldAdd){
				[result insertObject:wordStat atIndex:idx];
			}
			idx++;
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
		IRWordWithStatisticsInGame* match;
		if(insertIndex<[gameStatistics count]){
			match = [gameStatistics objectAtIndex:insertIndex];
			if([match wordID]!=[currentWord wordID]){
				[gameStatistics insertObject:[list objectAtIndex:i] atIndex:insertIndex];
			} else {
				[match updateStatWithStat:currentWord];
			}
		} else {
			[gameStatistics insertObject:[list objectAtIndex:i] atIndex:insertIndex];
		}
	}
}

-(BOOL)isEqual:(IRWordList*)wl{
	if(self==nil || wl==nil) return NO;
	else
	{
		return [self.listName isEqual:wl.listName];
	}
}

-(void)encodeWithCoder:(NSCoder *)coder{
	[super encodeWithCoder:coder];
	[coder encodeObject:listName forKey:@"listName"];
	[coder encodeObject:wordsWithStatistics forKey:@"wordsWithStatistics"];
	[coder encodeObject:wordsWithStatisticsInGame forKey:@"wordsWithStatisticsInGame"];
}

-(id)initWithCoder:(NSCoder *)decoder{
	if([super initWithCoder:decoder]!=nil){
		[self setListName:[decoder decodeObjectForKey:@"listName"]];
		[self setWordsWithStatistics:[decoder decodeObjectForKey:@"wordsWithStatistics"]];
		[self setWordsWithStatisticsInGame:[decoder decodeObjectForKey:@"wordsWithStatisticsInGame"]];
	}
	return self;
}

-(void)dealloc{
	[listName release];
	[wordsWithStatistics release];
	[wordsWithStatisticsInGame release];
	[super dealloc];
}

@end
