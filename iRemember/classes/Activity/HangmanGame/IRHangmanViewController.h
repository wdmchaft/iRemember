//
//  IRHangmanViewController.h
//  iRemember
//
//  Created by Zhang Ying on 4/3/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRWord.h"
#import "IRWordWithStatisticsInGame.h"


@interface IRHangmanViewController : UIViewController {
	IBOutlet UIImageView *_hangmanImageView;
	IBOutlet UILabel *_wordMeangingLabel;
	IBOutlet UIButton *_submitButton;
	NSMutableArray *inputLetters;
	
	NSMutableArray* wordsUsedForGameThreeDisplay;
	NSMutableArray* wordsWithStatisticsList;
	NSInteger wordDisplayId;
	IRWord *currentWord;
}

@property (nonatomic, retain) NSMutableArray *inputLetters;
@property(nonatomic,retain) NSMutableArray* wordsUsedForGameThreeDisplay;
@property(nonatomic,retain) NSMutableArray *wordsWithStatisticsList;
@property(nonatomic,retain) IRWord *currentWord;

- (IRWordWithStatisticsInGame*)getIRWordInStatisticsListBasedOnId:(NSInteger)wordIdNum;

- (IBAction) buttonPressed:(UIButton*)button;

@end
