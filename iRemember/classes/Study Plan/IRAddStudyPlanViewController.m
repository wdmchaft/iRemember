    //
//  IRAddStudyPlanViewController.m
//  iRemember
//
//  Created by Raymond Hendy on 4/1/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "IRAddStudyPlanViewController.h"

#define TABLEVIEW_X 113
#define TABLEVIEW_Y 93
#define TABLEVIEW_WIDTH 320
#define TABLEVIEW_HEIGHT 247

@implementation IRAddStudyPlanViewController

@synthesize textField;

#pragma mark -
#pragma mark Initialization

/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 self = [super initWithStyle:style];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


#pragma mark -
#pragma mark View lifecycle

-(void)cancel {
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

-(void)save {
	// save
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save"
													message:textField.text
												   delegate:self
										  cancelButtonTitle:@"Cancel"
										  otherButtonTitles:@"OK",nil];
	[alert show];
}

-(void)addButtonPressed {
	
}

-(void)configureNavBar {
	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
																  style:UIBarButtonSystemItemCancel
																 target:self action:@selector(cancel)];
	UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"Save"
																  style:UIBarButtonSystemItemSave
																 target:self action:@selector(save)];
	
	self.navigationItem.leftBarButtonItem = cancelBtn;
	self.navigationItem.rightBarButtonItem = saveBtn;
	[saveBtn release];
	[cancelBtn release];
}

-(void)configureToolbar {	
	self.navigationController.toolbarHidden = NO;
	self.navigationController.toolbar.tintColor = [UIColor brownColor];
	UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																			 target:self
																			 action:@selector(addButtonPressed)];
	self.toolbarItems = [NSArray arrayWithObjects:addItem,nil];
	
	[addItem release];	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"New Study Plan";
	[self configureToolbar];
	[self configureNavBar];
}

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.textLabel.text = @"Test";
	if(indexPath.row==0)
	cell.detailTextLabel.text = @"Very long long long long long long long long long long long long long long long long long long long long long Detail Test";
	if(indexPath.row==1)
	cell.detailTextLabel.text =@"test det";
	cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.detailTextLabel.numberOfLines = 2;
	cell.detailTextLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
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

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
