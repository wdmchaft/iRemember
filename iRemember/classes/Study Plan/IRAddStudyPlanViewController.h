//
//  IRAddStudyPlanViewController.h
//  iRemember
//
//  Created by Raymond Hendy on 4/1/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IRAddStudyPlanViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITextField *textField;
	IBOutlet UITableView *_tableView;
}

@property (retain) IBOutlet UITextField *textField;

@end
