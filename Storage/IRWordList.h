//
//  IRWordList.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRLibrary.h"
#import "IRWordWithStatistics.h"
#import "IRWordWithStatisticsInGame.h"

@interface IRWordList : IRLibrary {

}

@property(nonatomic,retain) NSString* listName;
// The name of this word list

@property(nonatomic,retain) NSMutableArray* wordsWithStatistics;
// The list of words with the statistics

@property(nonatomic,retain) NSMutableDictionary* wordsWithStatisticsInGame;
// The collection of word lists for each game statistics

-(id)initWithName:(NSString*)name lang:(NSString*)lang;

-(NSArray*)studied;
// EFFECTS: return the words which have been studied

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName;
// EFFECTS: updates the words with statistics in game

@end
