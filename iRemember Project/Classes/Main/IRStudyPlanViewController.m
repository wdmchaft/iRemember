//
//  StudyPlanViewController.m
//  iRemember
//
//  Created by Raymond Hendy on 3/22/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "IRStudyPlanViewController.h"


@implementation IRStudyPlanViewController

-(void)addButtonPressed {
	IRAddStudyPlanViewController *addStudyPlanController = [[IRAddStudyPlanViewController alloc] initWithNibName:@"AddStudyPlanView" bundle:nil];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addStudyPlanController];
	navController.navigationBar.tintColor = [UIColor brownColor];
	navController.modalPresentationStyle = UIModalPresentationFormSheet;
	[[self navigationController] presentModalViewController:navController animated:YES];
	
	[navController release];
	[addStudyPlanController release];
}

-(void)configureToolbarItems {	
	UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																			 target:self
																			 action:@selector(addButtonPressed)];
	self.toolbarItems = [NSArray arrayWithObjects:addItem,nil];
	
	[addItem release];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.textLabel.text = @"Test";
	cell.textLabel.backgroundColor = [UIColor clearColor];
    // Configure the cell...
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

#pragma mark -
#pragma mark Memory management

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Study Plan";
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-wood2.jpg"]];
	[self configureToolbarItems];
	
	UIView *tableBgView = [[UIView alloc] init];
	tableBgView.backgroundColor = [UIColor colorWithRed:0.898 green:0.824 blue:0.686 alpha:1];
	_tableView.layer.borderColor = [[UIColor colorWithRed:0.65 green:0.35 blue:0 alpha:1] CGColor];
	_tableView.layer.borderWidth = 5;
	_tableView.backgroundView = tableBgView;
	
	// TODO: get list of study plans here
	
	// if(there is no study plan)
	/*UILabel	*studyPlanEmptyLabel = [[UILabel alloc] init];
	studyPlanEmptyLabel.text = @"You have not created any study plans.";
	studyPlanEmptyLabel.font = [UIFont systemFontOfSize:24];
	studyPlanEmptyLabel.frame = CGRectMake(0, 0, 420, 50);
	studyPlanEmptyLabel.center = CGPointMake(self.view.center.x, self.view.center.y-self.navigationController.toolbar.frame.size.height);
	studyPlanEmptyLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview:studyPlanEmptyLabel];
	[studyPlanEmptyLabel release];*/
	
	// else
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
