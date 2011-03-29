//
//  AppState.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWordList.h"
#import "IRStudyPlan.h"
#import "IRHeader.h"

@interface IRAppState : NSObject {
	NSArray* wordsForGame;
}

@property(nonatomic,retain) NSMutableArray* libraries;
// The list of libraries of different languages

@property(nonatomic,retain) IRStudyPlan* currentStudyPlan;

+(id)currentState;
// EFFECTS: return the current state of the app

-(void)save;
// EFFECTS: save current state to file

-(void)load;
// EFFECTS: load a state from a file

-(void)setWordsForGameWithMode:(GameStartMode)mode;
// EFFECTS: set up the word list to be used by the game
// This method is not yet finalized, the method header may change

-(NSArray*)wordsForGame;
// REQUIRES: setWordsForGameWithMode is called before this function
// EFFECTS: return the list of words that can be used in the game

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName;
// REQUIRES: list contain IRWordWithStatisticsInGame objects that contain updated contents
// EFFECTS: the list of word with statistics in game stored in the wordlist inside current
//          study plan will be updated

@end