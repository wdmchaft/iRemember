//
//  iRememberViewController.h
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashcardViewController.h"

@interface iRememberViewController : UIViewController {
	FlashcardViewController *flashcardView;
}

-(IBAction)start;

@end

