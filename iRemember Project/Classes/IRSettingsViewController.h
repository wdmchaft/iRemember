//
//  SettingsViewController.h
//  iRemember
//
//  Created by Raymond Hendy on 3/31/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IRSettingsViewController : UITableViewController {
	NSArray *sectionArray;
	NSArray *contentArray;
	NSInteger _section;
	NSInteger _row;
}

@end
