//
//  FlashcardViewController.m
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "IRFlashcardViewController.h"

@implementation IRFlashcardViewController


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft
	|| interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

// NOTE: Use this initializer to load from AppState
/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
*/

- (id)initWithPageNumber:(int)page Content:(NSString *)contentin
{

	self = [super initWithNibName:@"FlashcardView" bundle:nil];
	if(self)
	{
		pageNumber = page;
		content = contentin;
		NSLog(@"content init: %s",content);
		//self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-wood2.jpg"]];
		self.view.backgroundColor = [UIColor clearColor];
		self.title = @"Study";
		
		NSLog(@"Viewload %s",content);
		self.view.multipleTouchEnabled = YES;
		self.view.userInteractionEnabled = YES;
		
		[WordView.layer setBorderWidth:7.5];
		[WordView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
		WordView.text = content;
		WordView.editable = FALSE;
		[WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
		
		NSLog(@"Titel %s",self.title);
	}
	
	return self;
}
	



// NOTE: Can be implemented using UIScrollView. Can slide the whole view, instead of just changing the words.

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
/*
	 [super viewDidLoad];
	 self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-wood2.jpg"]];
	 self.title = @"Study";
	 
	 NSLog(@"Viewload %s",content);
	 self.view.multipleTouchEnabled = YES;
	 self.view.userInteractionEnabled = YES;
	 
	 [WordView.layer setBorderWidth:7.5];
	 [WordView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
	 WordView.text = content;
	 WordView.editable = FALSE;
	 [WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
	 
*/	 
	 
 }

- (int)suitableFontSize:(NSString*)display{
	return 24;
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
