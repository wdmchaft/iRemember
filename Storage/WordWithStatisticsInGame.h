//
//  WordWithStatisticsInGame.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordWithStatisticsInGame : NSObject {

}

@property(nonatomic) NSInteger wordID;
@property(nonatomic) NSInteger correctCount;
@property(nonatomic) NSInteger incorrectCount;
@property(nonatomic) NSInteger totalReactionTime;

-(NSInteger)usedCount;
// RETURNS: The total number this word has been used in a game session

-(void)addTotalReactionTime:(NSInteger)time;
// MODIFIES: self
// EFFECTS: add the specified time to the totalReactionTime=

-(CGFloat)getAverageReactionTime;
// EFFECTS: returns the average reaction time

@end