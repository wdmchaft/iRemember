//
//  iRememberAppDelegate.h
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iRememberViewController;

@interface iRememberAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iRememberViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iRememberViewController *viewController;

@end

