//
//  IRMCQViewController.h
//  iRemember
//
//  Created by Zhang Ying on 3/30/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRWord.h"
//#import "MainLogic.h"
#import "IRWordWithStatisticsInGame.h"
#import "IRQuestionTableViewController.h"
#import "IRMCQResultTableViewController.h"

@interface IRMCQViewController : UIViewController <UIScrollViewDelegate> {
	NSMutableArray* wordsUsedForGameOneDisplay;
	NSMutableArray* wordsWithStatisticsList;
	NSInteger wordDisplayId;
	IRQuestionTableViewController *questionTableView;
	IRWord *currentWord;
	NSString *currentQuestion;
	NSMutableArray *currentChoices;
	NSString *currentAnswer;
	
	UIPopoverController * resultPop;
}
@property(nonatomic,retain) NSMutableArray* wordsUsedForGameOneDisplay;
@property(nonatomic,retain) IRQuestionTableViewController *questionTableView;
@property(nonatomic,retain) NSString *currentQuestion;
@property(nonatomic,retain) NSMutableArray *currentChoices;
@property(nonatomic,retain) NSString *currentAnswer;
@property(nonatomic,retain) NSMutableArray *wordsWithStatisticsList;
@property(nonatomic,retain) IRWord *currentWord;

- (void)updateNewQuestionTableView;
- (IRWordWithStatisticsInGame*)getIRWordInStatisticsListBasedOnId:(NSInteger)wordIdNum;

@end
