//
//  IRQuestionsViewController.m
//  IRMCQ
//
//  Created by Zhang Ying on 3/31/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import "IRQuestionTableViewController.h"


@implementation IRQuestionTableViewController

@synthesize questionToDisplay;
@synthesize choicesToDisplay;
@synthesize answer;
@synthesize delegate;

const int ICON_LENGTH = 40;

#pragma mark -
#pragma mark Initialization


- (id)initWithQuestion:(NSString*)question Choices:(NSMutableArray*)choices Answer:(NSString*)ans{
	if (self = [super initWithStyle:UITableViewStyleGrouped]){
		questionToDisplay = question;
		choicesToDisplay = choices;
		answer = ans;
	}
	return self;
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.clearsSelectionOnViewWillAppear;
	//self.contentSizeForViewInPopover = CGSizeMake(400, 650);
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	if (indexPath.row == 0){
		//cell.textLabel.text = questionToDisplay;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
		label.textAlignment =  UITextAlignmentCenter;
		label.textColor = [UIColor whiteColor];
		label.backgroundColor = [UIColor blueColor];
		label.text = questionToDisplay;
		label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
		[cell.contentView addSubview:label];
		[label release];
	}else{
		NSString *givenChoice = [choicesToDisplay objectAtIndex:indexPath.row-1];
		cell.textLabel.text = [givenChoice stringByDeletingPathExtension];
	}
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (delegate != nil && indexPath.row != 0){
		NSString *userChoice = [choicesToDisplay objectAtIndex:indexPath.row-1];
		NSString *judgement;
		UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
		if ([userChoice isEqual:answer]){
			judgement = @"right";
			cell.detailTextLabel.text = @"correct";
			cell.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Check-icon.png"]] autorelease];
			cell.accessoryView.bounds = CGRectMake(0, 0, ICON_LENGTH, ICON_LENGTH);
		}else {
			judgement = @"wrong";
			cell.detailTextLabel.text = @"wrong";
			cell.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cross_icon.png"]] autorelease];
			cell.accessoryView.bounds = CGRectMake(0, 0, ICON_LENGTH, ICON_LENGTH);
		}
		tableView.allowsSelection = NO;
		[delegate isChoiceRight:judgement];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 0){
		return 100;
	}else {
		return 44;
	}
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
	[choicesToDisplay release];
	[answer release];
	[questionToDisplay release];
    [super dealloc];
}


@end

