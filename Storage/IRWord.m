//
//  Word.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRWord.h"


@implementation IRWord

@synthesize wordID, englishWord, translatedWord, language, pronunciation, difficulty, example, explanation, soundFileName;

-(id)initWithID:(NSInteger)wordId englishWord:(NSString *)eng translated:(NSString *)trans lang:(NSString *)lang{
	[super init];
	if(self!=nil){
		[self setWordID:wordId];
		[self setEnglishWord:eng];
		[self setTranslatedWord:trans];
		[self setLanguage:lang];
	}
	return self;
}

-(void)dealloc{
	[super dealloc];
}

@end
