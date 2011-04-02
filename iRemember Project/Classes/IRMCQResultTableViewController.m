//
//  IRMCQResultTableViewController.m
//  IRMCQ
//
//  Created by Zhang Ying on 4/1/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import "IRMCQResultTableViewController.h"


@implementation IRMCQResultTableViewController

@synthesize wordWithStatisticsInGame;
@synthesize wordsInGame;

#pragma mark -
#pragma mark Initialization

- (id)initWithWordWithStatisticsInGame:(NSMutableArray*)wordWithStsInGame  WithWords:(NSMutableArray*)wordsInG{
	if (self = [super initWithStyle:UITableViewStylePlain]){
		wordWithStatisticsInGame = wordWithStsInGame;
		wordsInGame = wordsInG;
	}
	return self;
}

- (void)doneButtonPressed {
	[[self parentViewController] dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.allowsSelection = NO;
	self.title = @"Review Results";
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStyleDone
																  target:self
																  action:@selector(doneButtonPressed)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark -
#pragma mark View lifecycle


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
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
    return [wordWithStatisticsInGame count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [[wordsInGame objectAtIndex:indexPath.row] englishWord];
	NSString *result = @"Incorrect Counts: ";
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@",result,[NSString stringWithFormat:@"%d",[[wordWithStatisticsInGame objectAtIndex:indexPath.row] incorrectCount]]];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // disable selections
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
	[wordWithStatisticsInGame release];
	[wordsInGame release];
    [super dealloc];
}


@end

