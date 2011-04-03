//
//  StudyPlanViewController.h
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "IRAddStudyPlanViewController.h"
#import "IRStudyPlan.h"
#import "IRHeader.h"

@interface IRStudyPlanViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *_tableView;
	NSMutableArray *studyPlans;
}

@property (retain) NSMutableArray *studyPlans;

@end
