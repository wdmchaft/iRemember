//
//  FlashcardViewController.m
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "FlashcardViewController.h"

@implementation FlashcardViewController



-(void)switchBack {
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft
	|| interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}





 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 [super viewDidLoad];
	 wordsUsedForFlashcardDisplay = [[NSMutableArray alloc]init];
	 wordDisplayId = 0;
	 /* Code in real case
	 NSMutableArray wordsUsedForFlashcardDisplay = [MainLogic getWordsUsedForFlashcardDisplay];
	 
	*/
	 
	 //Code for Testing Run
	// NSMutableArray *wordsUsedForFlashcardDisplay = [[NSMutableArray alloc]init];
	 IRWord *word = [[IRWord alloc]initWithID:1 englishWord:@"abuct" translated:@"suddeb" lang:@"IND"];
	 [wordsUsedForFlashcardDisplay addObject:word];
	 word = [[IRWord alloc]initWithID:2 englishWord:@"about" translated:@"around" lang:@"IND"];
	 [wordsUsedForFlashcardDisplay addObject:word];
	 word = [[IRWord alloc]initWithID:3 englishWord:@"above" translated:@"on" lang:@"IND"];
	 [wordsUsedForFlashcardDisplay addObject:word];
	 word = [[IRWord alloc]initWithID:4 englishWord:@"abut" translated:@"close" lang:@"IND"];
	 [wordsUsedForFlashcardDisplay addObject:word];
	 //end code for testing run
	 
	 
	 self.view.multipleTouchEnabled = YES;
	 self.view.userInteractionEnabled = YES;
	 
	 //Right Swipe Gesture
	 UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToNext:)];
	 [self.view addGestureRecognizer:swipeGestureRecognizer];
	 [swipeGestureRecognizer release];
	 
	 //Left Swipe Gesture
	 swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToPrev:)];
	 [WordView addGestureRecognizer:swipeGestureRecognizer];
	 swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
	 [self.view addGestureRecognizer:swipeGestureRecognizer];
	 [swipeGestureRecognizer release];
	 
	 //Setting up property of WordView
	 WordView.editable = FALSE;
	 WordView.text = [self getDisplayForWordDisplayId:wordDisplayId];
	 [WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
	 
	 
	 
 }

- (NSString*)getDisplayForWordDisplayId:(int)displayid{
	IRWord *word = [wordsUsedForFlashcardDisplay objectAtIndex:displayid];
	NSString *display = @"English Word: ";
	display = [display stringByAppendingString:[word englishWord]];
	display = [display stringByAppendingString:@"\n\n"];
	display = [display stringByAppendingString:@"Meaning: "];
	display = [display stringByAppendingString:[word translatedWord]];
	display = [display stringByAppendingString:@"\n\n"];
//	NSLog(display);
	return display;
}
	
	
- (void)swipeToPrev:(UISwipeGestureRecognizer *)gesture{
	
	NSLog(@"%d",gesture.direction);
	
	if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) 
	{
		NSLog(@"Right");
		if (wordDisplayId < [wordsUsedForFlashcardDisplay count]-1) 
		{
			wordDisplayId = wordDisplayId + 1;
			WordView.text = [self getDisplayForWordDisplayId:wordDisplayId];
			[WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
		}
		else if(wordDisplayId ==[wordsUsedForFlashcardDisplay count]-1) 
		{
			WordView.text = [self getDisplayForWordDisplayId:wordDisplayId];
			[WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
		}
		
	}

}

- (void)swipeToNext:(UISwipeGestureRecognizer *)gesture{
	if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
	{
		NSLog(@"Left");
		
		if (wordDisplayId > 0) 
		{
			wordDisplayId = wordDisplayId - 1;
			WordView.text = [self getDisplayForWordDisplayId:wordDisplayId];
			[WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
		}
		else if(wordDisplayId ==0) 
		{
			WordView.text = [self getDisplayForWordDisplayId:wordDisplayId];
			[WordView setFont:[UIFont fontWithName:@"ArialMT" size:[self suitableFontSize:WordView.text]]];
		}
	}
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
