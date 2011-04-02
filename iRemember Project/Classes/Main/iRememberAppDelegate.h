//
//  iRememberAppDelegate.h
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRScrollViewWithPagingViewController.h"

@interface iRememberAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UINavigationController *navigationController;
	IRScrollViewWithPagingViewController *scrollviewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet IRScrollViewWithPagingViewController *scrollviewController;

@end

