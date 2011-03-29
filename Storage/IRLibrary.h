//
//  Library.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWord.h"

@interface IRLibrary : NSObject {

}

@property(nonatomic,retain) NSMutableArray* words;
@property(nonatomic,retain) NSString* language;
// Array of Word

-(id)initWithLanguage:(NSString*)lang;

-(BOOL)checkIDConsistency;
// EFFECTS: return YES if the wordIDs in the word list is consistent (no duplicates), NO otherwise

-(NSInteger)availableID;
// EFFECTS: return an available number that can be used for wordID;

-(NSArray*)availableIDWithCount:(int)count;
// EFFECTS: return a list of numbers that are available to be used for wordID;

-(IRWord*)wordWithID:(NSInteger)wordID;
// EFFECTS: return the Word object with specified wordID, nil if not found

-(IRWord*)wordWithString:(NSString*)theWord;
// EFFECTS: return the Word object with the specified english word, nil if not found

-(IRWord*)addWord:(NSString*)eng translation:(NSString*)trans lang:(NSString*)lang;
// MODIFIES: words in self
// EFFECTS: add a word with the specified parameters
//          return the created Word object

-(int)addWords:(NSArray*)wordList;
// MODIFIES: words in self
// EFFECTS: add the words in the given list into this list
//			returns the actual number of words added to the list

-(BOOL)removeWordWithID:(NSInteger)wordID;
// MODIFIES: words in self
// EFFECTS: remove the word with the specified id
//			return YES if it's successfully removed

-(BOOL)removeWordWithString:(NSString*)theWord;
// MODIFIES: words in self
// EFFECTS: remove any word that matches the specified English Word
//			returns YES if it's successfully removed

-(NSInteger)count;
// EFFECTS: returns the number of words in this library

@end
