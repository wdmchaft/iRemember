//
//  IRReviewViewController.m
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "IRReviewViewController.h"


@implementation IRReviewViewController

-(void)gameMCQController {
	IRMCQViewController *mcqController = [[IRMCQViewController alloc] init];
	[self.navigationController pushViewController:mcqController animated:YES];
	[mcqController release];
}

-(IBAction)buttonPressed:(UIButton *)button {
	if([button.titleLabel.text isEqual:@"MCQ"]) {
		[self gameMCQController];
	}
}

-(void)configureToolbarItems {	
	//self.toolbarItems = [NSArray arrayWithObjects:,nil];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Review";
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-wood2.jpg"]];
	[self configureToolbarItems];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft
	|| interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end