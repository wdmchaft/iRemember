//
//  IRMCQViewController.m
//  iRemember
//
//  Created by Zhang Ying on 3/30/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import "IRMCQViewController.h"


@implementation IRMCQViewController

@synthesize questionTableView;
@synthesize currentQuestion;
@synthesize wordsUsedForGameOneDisplay;
@synthesize currentChoices;
@synthesize currentAnswer;
@synthesize wordsWithStatisticsList;
@synthesize currentWord;

const int TABLEVIEW_ORIGIN_X = 200;
const int TABLEVIEW_ORIGIN_Y = 100;
const int TABLEVIEW_WIDTH = 500;
const int TABLEVIEW_HEIGHT = 500;

- (void)setUpWords {
	
	// wordsUsedForGameOneDisplay = [MainLogic getWordsUsedForGameDisplay];
	
	wordsUsedForGameOneDisplay = [[NSMutableArray alloc] init];
	wordsWithStatisticsList = [[NSMutableArray alloc] init];
	wordDisplayId = 0;
	
	IRWord *word = [[IRWord alloc]initWithID:1 englishWord:@"abuct" translated:@"suddeb" lang:@"IND"];
	[wordsUsedForGameOneDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:2 englishWord:@"about" translated:@"around" lang:@"IND"];
	[wordsUsedForGameOneDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:3 englishWord:@"above" translated:@"on" lang:@"IND"];
	[wordsUsedForGameOneDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:4 englishWord:@"abut" translated:@"close" lang:@"IND"];
	[wordsUsedForGameOneDisplay addObject:word];
	[word release];
	
	for (IRWord *word in wordsUsedForGameOneDisplay){
		IRWordWithStatisticsInGame *wordWithSt = [[IRWordWithStatisticsInGame alloc] init];
		wordWithSt.wordID = word.wordID;
		wordWithSt.correctCount = 0;
		wordWithSt.incorrectCount = 0;
		wordWithSt.totalReactionTime = 0;
		[wordsWithStatisticsList addObject:wordWithSt];
	}
	
}

- (void)setUpGestures {
	//self.view.multipleTouchEnabled = YES;
	//self.view.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setUpWords];
	[self setUpGestures];
	wordDisplayId = 0;
	[self updateNewQuestionTableView];
	[self.view addSubview:questionTableView.tableView];
	questionTableView.tableView.frame = CGRectMake(TABLEVIEW_ORIGIN_X,TABLEVIEW_ORIGIN_Y,500,1000);
	NSLog(@"%@",[self class]);
	NSLog(@"%@", [questionTableView class]);
	
}


- (void)updateNewQuestionTableView{
	self.currentWord = [wordsUsedForGameOneDisplay objectAtIndex:wordDisplayId];
	currentQuestion = [currentWord englishWord];
	currentAnswer = [currentWord translatedWord];
	NSInteger correctWordsPos = arc4random() % 4;
	NSInteger chosenPos1=-1;
	NSInteger chosenPos2=-1;
	NSInteger chosenPos3=-1;
	NSInteger chosenPos = arc4random() % [wordsWithStatisticsList count];
	while (chosenPos1 ==-1 || chosenPos2 ==-1 || chosenPos3 == -1){
		IRWord *tempWord = [wordsUsedForGameOneDisplay objectAtIndex:chosenPos];
		if (chosenPos1==-1 && tempWord.wordID!=currentWord.wordID){
			chosenPos1 = chosenPos;
			chosenPos = arc4random() % [wordsWithStatisticsList count];
		}else if (chosenPos1 !=chosenPos && chosenPos2==-1 && tempWord.wordID!=currentWord.wordID){
			chosenPos2 = chosenPos;
			chosenPos = arc4random() % [wordsWithStatisticsList count];
		}else if (chosenPos1 !=chosenPos && chosenPos2 !=chosenPos && chosenPos3==-1 && tempWord.wordID!=currentWord.wordID){
			chosenPos3 = chosenPos;
			break;
		}else {
			chosenPos = arc4random() % [wordsWithStatisticsList count];
		}

		printf("chosenpos1 = %d ; chosenpos2 = %d ; chosenpos3 = %d;\n",chosenPos1,chosenPos2,chosenPos3);
	}
	currentChoices = [[NSMutableArray alloc] init];
	[currentChoices addObject:[[wordsUsedForGameOneDisplay objectAtIndex:chosenPos1] translatedWord]];
	[currentChoices addObject:[[wordsUsedForGameOneDisplay objectAtIndex:chosenPos2] translatedWord]];
	[currentChoices addObject:[[wordsUsedForGameOneDisplay objectAtIndex:chosenPos3] translatedWord]];
	[currentChoices insertObject:currentAnswer atIndex:correctWordsPos];
	self.questionTableView = [[IRQuestionTableViewController alloc] initWithQuestion:currentQuestion
																		Choices:currentChoices 
																		 Answer:currentAnswer];
	questionTableView.delegate = self;
	questionTableView.tableView.scrollEnabled = NO;
	
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft
	|| interfaceOrientation == UIInterfaceOrientationLandscapeRight;
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

- (void)changeToNext {
	if (wordDisplayId >=[wordsUsedForGameOneDisplay count]-1) {
		//resultPop = [[UIPopoverController alloc] initWithContentViewController:self];
		//resultPop.popoverContentSize = CGSizeMake(320, 220);
		
		IRMCQResultTableViewController *resultListController = [[IRMCQResultTableViewController alloc] initWithWordWithStatisticsInGame:wordsWithStatisticsList 
																															  WithWords:wordsUsedForGameOneDisplay];
		
		UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:resultListController];
		navigationController.navigationBar.tintColor = [UIColor brownColor];
		
		navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
		[self presentModalViewController:navigationController animated:YES];
		
		[navigationController release];
		[resultListController release];
		
		return;
	}else {
		wordDisplayId++;
		UIView* sup = questionTableView.view.superview;
		[questionTableView.tableView removeFromSuperview];
		[questionTableView release];
		[self updateNewQuestionTableView];
		NSLog(@"%@",[self class]);
		NSLog(@"%@",[questionTableView class]);
		NSLog(@"%@",(self.view==sup)?@"YES":@"NO");
		[sup addSubview:questionTableView.tableView];	
		questionTableView.tableView.frame = CGRectMake(TABLEVIEW_ORIGIN_X,TABLEVIEW_ORIGIN_Y,TABLEVIEW_WIDTH,TABLEVIEW_HEIGHT);
	}
}


- (void)isChoiceRight:(NSString*)judgement{
	NSLog(judgement);
	if ([judgement isEqual:@"right"]){
		// update the statistics
		IRWordWithStatisticsInGame *wordWithSt =[self getIRWordInStatisticsListBasedOnId:currentWord.wordID];
		if (wordWithSt != nil){
			[wordWithSt setCorrectCount:([wordWithSt correctCount]+1)];
		}else {
			printf("this is nil!!!");
		}

	}else {
		// add the wrong one to the end of the array
		[wordsUsedForGameOneDisplay addObject:currentWord];
		// update the statistics
		IRWordWithStatisticsInGame *wordWithSt =[self getIRWordInStatisticsListBasedOnId:currentWord.wordID];
		if (wordWithSt != nil){
			[wordWithSt setIncorrectCount:([wordWithSt incorrectCount]+1)];
		}else {
			printf("this is nil!!!!!");
		}
	}
	// move to the next
	[NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(changeToNext)
                                   userInfo:nil
                                    repeats:NO];
}

- (IRWordWithStatisticsInGame*)getIRWordInStatisticsListBasedOnId:(NSInteger)wordIdNum {
	
	for (IRWordWithStatisticsInGame *word in wordsWithStatisticsList){
		if (word.wordID == wordIdNum){
			return word;
		}
	}
	return nil;
}

- (void)dealloc {
	[wordsUsedForGameOneDisplay release];
	[wordsWithStatisticsList release];
	[questionTableView release];
	[currentQuestion release];
	[currentChoices release];
	[currentAnswer release];
	[resultPop release];
	[currentWord release];
    [super dealloc];
}


@end
