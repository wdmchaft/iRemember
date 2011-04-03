    //
//  IRHangmanViewController.m
//  iRemember
//
//  Created by Zhang Ying on 4/3/11.
//  Copyright 2011 SoC. All rights reserved.
//

#import "IRHangmanViewController.h"


@implementation IRHangmanViewController

@synthesize inputLetters;
@synthesize wordsUsedForGameThreeDisplay;
@synthesize wordsWithStatisticsList;
@synthesize currentWord;

- (void)setUpWords {
	
	// wordsUsedForGameThreeDisplay = [MainLogic getWordsUsedForGameDisplay];
	
	wordsUsedForGameThreeDisplay = [[NSMutableArray alloc] init];
	wordsWithStatisticsList = [[NSMutableArray alloc] init];
	wordDisplayId = 0;
	
	IRWord *word = [[IRWord alloc]initWithID:1 englishWord:@"abuct" translated:@"suddeb" lang:@"IND"];
	[wordsUsedForGameThreeDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:2 englishWord:@"about" translated:@"around" lang:@"IND"];
	[wordsUsedForGameThreeDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:3 englishWord:@"above" translated:@"on" lang:@"IND"];
	[wordsUsedForGameThreeDisplay addObject:word];
	[word release];
	word = [[IRWord alloc]initWithID:4 englishWord:@"abut" translated:@"close" lang:@"IND"];
	[wordsUsedForGameThreeDisplay addObject:word];
	[word release];
	
	for (IRWord *word in wordsUsedForGameThreeDisplay){
		IRWordWithStatisticsInGame *wordWithSt = [[IRWordWithStatisticsInGame alloc] init];
		wordWithSt.wordID = word.wordID;
		wordWithSt.correctCount = 0;
		wordWithSt.incorrectCount = 0;
		wordWithSt.totalReactionTime = 0;
		[wordsWithStatisticsList addObject:wordWithSt];
	}
	
	currentWord = [wordsUsedForGameThreeDisplay objectAtIndex:wordDisplayId];
}

- (void)updateHangmanImage {
	NSInteger numberOfIncorrect = [[self getIRWordInStatisticsListBasedOnId:currentWord.wordID] incorrectCount];
	if (numberOfIncorrect == 0){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-0.png"];
	}else if (numberOfIncorrect == 1){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-1.png"];
	}else if (numberOfIncorrect == 2){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-2.png"];
	}else if (numberOfIncorrect == 3){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-3.png"];
	}else if (numberOfIncorrect == 4){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-4.png"];
	}else if (numberOfIncorrect == 5){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-5.png"];
	}else if (numberOfIncorrect == 6){
		_hangmanImageView.image = [UIImage imageNamed:@"Hangman-6.png"];
	}else {
		return;
	}

}

- (void)updateTextboxOnView {
	inputLetters = [[NSMutableArray alloc] init];
	for (int i = 0; i < [[currentWord englishWord] length]; i++){
		UITextField *textbox = [[UITextField alloc] initWithFrame:CGRectMake(600+50*i, 250, 40, 40)];
		textbox.delegate = self;
		textbox.placeholder = @"W";
		textbox.textAlignment = UITextAlignmentCenter;
		textbox.borderStyle = UITextBorderStyleLine;
		textbox.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(30.0)];
		[self.view addSubview: textbox];
        [textbox release];
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	wordDisplayId = 0;
	// set up words
	[self setUpWords];
	// set up the first word meaning label textview
	_wordMeangingLabel.lineBreakMode = UILineBreakModeWordWrap;
	_wordMeangingLabel.numberOfLines = 0;
	_wordMeangingLabel.textAlignment =  UITextAlignmentCenter;
	_wordMeangingLabel.textColor = [UIColor whiteColor];
	_wordMeangingLabel.backgroundColor = [UIColor orangeColor];
	_wordMeangingLabel.text = [currentWord translatedWord] ;
	
	// set up the hangman picture
	[self updateHangmanImage];
	// set up the textbox for the first word
	[self updateTextboxOnView];
}

- (IRWordWithStatisticsInGame*)getIRWordInStatisticsListBasedOnId:(NSInteger)wordIdNum {
	
	for (IRWordWithStatisticsInGame *word in wordsWithStatisticsList){
		if (word.wordID == wordIdNum){
			return word;
		}
	}
	return nil;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
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
	NSLog(@"asd");
	[inputLetters release];
	[wordsUsedForGameThreeDisplay release];
	[wordsWithStatisticsList release];
	[currentWord release];
    [super dealloc];
}


@end
