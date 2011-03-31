//
//  FlashcardViewController.h
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainLogic.h"


//Import for test
#import "IRWord.h"
#import "IRWordList.h"

@interface FlashcardViewController : UIViewController {
	IBOutlet UITextView *WordView;
	//IBOutlet UIView *view;
	NSMutableArray *wordsUsedForFlashcardDisplay;
	int wordDisplayId;
}

-(IBAction)switchBack;
- (int)suitableFontSize:(NSString*)display;
- (NSString*)getDisplayForWordDisplayId:(int)displayid;

@end
