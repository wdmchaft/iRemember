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

-(BOOL)isEqual:(IRWord*)word{
	if(self==nil || word==nil) return NO;
	return (self.wordID == word.wordID&&
		   self.englishWord == word.englishWord &&
		   [self.translatedWord isEqual: word.translatedWord] &&
		   [self.language isEqual: word.language] &&
		   [self.pronunciation isEqual: word.pronunciation] &&
		   self.difficulty == word.difficulty &&
		   [self.example isEqual: word.example] &&
		   [self.explanation isEqual: word.explanation] &&
		   [self.soundFileName isEqual: word.soundFileName]);
}

-(void)encodeWithCoder:(NSCoder*)coder{
	[coder encodeInteger:wordID forKey:@"wordID"];
	[coder encodeObject:englishWord forKey:@"englishWord"];
	[coder encodeObject:translatedWord forKey:@"translatedWord"];
	[coder encodeObject:language forKey:@"language"];
	[coder encodeObject:pronunciation forKey:@"pronunciation"];
	[coder encodeInteger:difficulty forKey:@"difficulty"];
	[coder encodeObject:example forKey:@"example"];
	[coder encodeObject:explanation forKey:@"explanation"];
	[coder encodeObject:soundFileName forKey:@"soundFileName"];
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil){
		[self setWordID:[decoder decodeIntegerForKey:@"wordID"]];
		[self setEnglishWord:[decoder decodeObjectForKey:@"englishWord"]];
		[self setTranslatedWord:[decoder decodeObjectForKey:@"translatedWord"]];
		[self setLanguage:[decoder decodeObjectForKey:@"language"]];
		[self setPronunciation:[decoder decodeObjectForKey:@"pronunciation"]];
		[self setDifficulty:[decoder decodeIntegerForKey:@"difficulty"]];
		[self setExample:[decoder decodeObjectForKey:@"example"]];
		[self setExplanation:[decoder decodeObjectForKey:@"explanation"]];
		[self setSoundFileName:[decoder decodeObjectForKey:@"soundFileName"]];
	}
	return self;
}

-(void)dealloc{
	[super dealloc];
}	   

@end
