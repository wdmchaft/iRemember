//
//  StudyPlan.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWordList.h"

typedef enum IRStudyMode{
	IRStudyModeDefault = 0,
	IRStudyModeDaily = 1,
	IRStudyModeWeekly = 2,
	IRStudyModeEbenhause = 3
} IRStudyMode;

typedef	 enum IRStudyOrdering {
	IRStudyOrderingAlphabetical = 0,
	IRStudyOrderingReversed = 1,
	IRStudyOrderingRandom = 2
} IRStudyOrdering;

@interface IRStudyPlan : NSObject {

}

@property(nonatomic,retain) NSString* name;
// The name of this word list

@property(nonatomic,retain) IRWordList* wordList;
// The list of words in this study plan

@property(nonatomic,retain) NSMutableArray* plannedReviewDates;
@property(nonatomic,retain) NSMutableArray* actualReviewDates;
@property(nonatomic) NSInteger elapsedDay;
@property(nonatomic) NSInteger totalDay;
@property(nonatomic,retain) NSDateComponents* reviewAlertTime;
@property (nonatomic) NSInteger numberOfWordsForReview;
@property (nonatomic, retain) NSString *defaultGameName;
@property (nonatomic) IRStudyOrdering studyOrdering;

-(id)init;
// Create the default study plan

-(id)initWithName:(NSString*)nam wordList:(IRWordList*)list;
// Create a study plan with specified parameters

-(NSString*)language;
// Returns the language of this study plan

-(void)setLanguage:(NSString*)lang;
// Set the language of this study plan, as defined in the wordlist it holds

-(IRWord*)addWord:(NSString *)eng translation:(NSString *)trans lang:(NSString *)lang;
// EFFECTS: add a word with specified parameters into this study plan's word list and
//			return the newly created word
//			this method will call respective method in word list, i.e. it will return nil
//			if the language is different from the current language

-(NSArray*)addWordsInList:(NSArray*)list;
// EFFECTS: add a list of IRWord objects into this study plan
//			Returns a list of words that were not added because of:
//			-wordID conflicts OR
//			-word with different language

-(NSArray*)difficultWords;
// EFFECTS: returns the list of words that are considered difficult according to the statistics

-(void)setUpReviewDatesWithMode:(IRStudyMode)mode;
// EFFECTS: set the review dates according to the mode, as defined in IRStudyPlan.h

-(void)didReviewAtDate:(NSDate*)date;
// EFFECTS: adds the date, which means a date where a review was conducted into the list
//			of actual review dates

-(void)updateStatisticsWithList:(NSArray*)list inGame:(NSString *)gameName;
// EFFECTS: updates the words with statistics in game

@end
