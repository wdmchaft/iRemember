//
//  IRReviewViewController.m
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "IRReviewViewController.h"


@implementation IRReviewViewController

-(void)configureButtons {
	UIColor *bgColor = [UIColor colorWithRed:.6 green:.4 blue:.2 alpha:.7];
	UIColor *borderColor = [UIColor colorWithRed:.37 green:.22 blue:.11 alpha:1];
	mcqButton.backgroundColor = bgColor;
	mcqButton.layer.borderColor = borderColor.CGColor;
	mcqButton.layer.cornerRadius = 5;
	mcqButton.layer.borderWidth = 5;
	
	gunShootButton.backgroundColor = bgColor;
	gunShootButton.layer.borderColor = borderColor.CGColor;
	gunShootButton.layer.cornerRadius = 5;
	gunShootButton.layer.borderWidth = 5;
	
	hangmanButton.backgroundColor = bgColor;
	hangmanButton.layer.borderColor = borderColor.CGColor;
	hangmanButton.layer.cornerRadius = 5;
	hangmanButton.layer.borderWidth = 5;
}

-(void)gameMCQController {
	IRMCQViewController *mcqController = [[IRMCQViewController alloc] init];
	[self.navigationController pushViewController:mcqController animated:YES];
	[mcqController release];
}

- (void)hangmanController {
	IRHangmanViewController *hangmanController = [[IRHangmanViewController alloc] initWithNibName:@"HangmanView" bundle:nil];
	[self.navigationController pushViewController:hangmanController animated:YES];
	[hangmanController release];
}

-(IBAction)buttonPressed:(UIButton *)button {
	if([button.titleLabel.text isEqual:@"Multiple Choice Quiz"]) {
		[self gameMCQController];
	}else if([button.titleLabel.text isEqual:@"Hangman"]) {
		[self hangmanController];
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
	[self configureButtons];
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