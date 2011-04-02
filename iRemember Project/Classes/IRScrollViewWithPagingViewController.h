//
//  ScrollViewWithPagingViewController.h
//  ScrollViewWithPaging
//

//

#import <UIKit/UIKit.h>

@interface IRScrollViewWithPagingViewController : UIViewController <UIScrollViewDelegate> {
	IBOutlet UIScrollView *scrollView;
	UIPageControl *pageControl;
    NSMutableArray *viewControllers;
    BOOL pageControlUsed;
	NSMutableArray *wordsUsedForFlashcardDisplay;
	NSInteger kNumberOfPages;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (IBAction)changePage:(id)sender;

@end

