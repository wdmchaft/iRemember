//
//  ScrollViewWithPagingViewController.m
//  ScrollViewWithPaging
//
//

#import "IRScrollViewWithPagingViewController.h"
#import "IRFlashcardViewController.h"





@interface IRScrollViewWithPagingViewController (PrivateMethods)

- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (NSString*)getDisplayForWordDisplayId:(int)displayid;

@end

@implementation IRScrollViewWithPagingViewController

@synthesize scrollView, viewControllers;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	wordsUsedForFlashcardDisplay = [[NSMutableArray alloc]init];
	/* Code in real case
	 NSMutableArray wordsUsedForFlashcardDisplay = [MainLogic getWordsUsedForFlashcardDisplay];
	 
	 */
	
	//Code for Testing Run
	// NSMutableArray *wordsUsedForFlashcardDisplay = [[NSMutableArray alloc]init];
	IRWord *word = [[IRWord alloc]initWithID:1 englishWord:@"abuct" translated:@"suddeb" lang:@"IND"];
	[wordsUsedForFlashcardDisplay addObject:word];
	word = [[IRWord alloc]initWithID:2 englishWord:@"你好" translated:@"around" lang:@"IND"];
	[wordsUsedForFlashcardDisplay addObject:word];
	word = [[IRWord alloc]initWithID:3 englishWord:@"above" translated:@"on" lang:@"IND"];
	[wordsUsedForFlashcardDisplay addObject:word];
	word = [[IRWord alloc]initWithID:4 englishWord:@"abut" translated:@"close" lang:@"IND"];
	[wordsUsedForFlashcardDisplay addObject:word];
	//end code for testing run
	
	kNumberOfPages = [wordsUsedForFlashcardDisplay count];
	
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
		IRFlashcardViewController *controller = [[IRFlashcardViewController alloc] initWithPageNumber:i Content:[self getDisplayForWordDisplayId:i]];
		[controllers addObject:controller];
		[controller release];

    }
    self.viewControllers = controllers;
    [controllers release];
	
    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-wood2.jpg"]];
	
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
	
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
	NSLog(@"Load Page 0");
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    IRFlashcardViewController *controller = [viewControllers objectAtIndex:page];
   	
    // add the controller's view to the scroll view
    //   if (nil == controller.view.superview) {
		NSLog(@"add subview %d",page);
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
		[scrollView addSubview:controller.view];
	    [scrollView bringSubviewToFront:controller.view];
  //  }
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
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
	[scrollView setContentOffset:CGPointMake(sender.contentOffset.x, 0)];
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [viewControllers release];
    [scrollView release];
    [pageControl release];
    [super dealloc];
}

@end
