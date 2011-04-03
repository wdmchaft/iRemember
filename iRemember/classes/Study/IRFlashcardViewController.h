//
//  FlashcardViewController.h
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

//Import for test
#import "IRWord.h"
#import "IRWordList.h"

@interface IRFlashcardViewController : UIViewController {
	IBOutlet UITextView *WordView;
	int pageNumber;
	NSString *content;
}
- (id)initWithPageNumber:(int)page Content:(NSString *)contentin;
- (int)suitableFontSize:(NSString*)display;


@end
