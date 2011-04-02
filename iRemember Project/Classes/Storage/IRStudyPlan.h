//
//  StudyPlan.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWordList.h"

@interface IRStudyPlan : NSObject {

}

@property(nonatomic,retain) NSString* name;
// The name of this word list

@property(nonatomic,retain) IRWordList* wordList;
// The list of words in this study plan

@property(nonatomic,retain) NSMutableArray* plannedReviewDates;
@property(nonatomic,retain) NSMutableArray* actualReviewDates;
@property(nonatomic) NSInteger elapsedDay;

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName;
// EFFECTS: updates the words with statistics in game

@end
