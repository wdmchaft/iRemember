//
//  Library.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface Library : NSObject {

}

@property(nonatomic,retain) NSMutableArray* words;
// Array of Word
// Sorted according to the English Word

-(BOOL)checkIDConsistency;
// EFFECTS: return YES if the wordIDs in the word list is consistent (no duplicates), NO otherwise

-(NSInteger)availableID;
// EFFECTS: return an available number that can be used for wordID;

-(NSArray*)availableIDWithCount:(int)count;
// EFFECTS: return a list of numbers that are available to be used for wordID;

-(Word*)wordWithID:(NSInteger)wordID;
// EFFECTS: return the Word object with specified wordID;

-(Word*)wordWithString:(NSString*)theWord;
// EFFECTS: return the Word object with the specified english word;

-(Word*)addWord:(NSString*)eng translation:(NSString*)trans lang:(NSString*)lang;
// MODIFIES: words in self
// EFFECTS: add a word with the specified parameters
//          return the created Word object

-(int)addWords:(NSArray*)wordList;
// MODIFIES: words in self
// EFFECTS: add the words in the given list of Word object into current list
//			returns the actual number of words added to the list

-(BOOL)removeWordWithID:(NSInteger)wordID;
// MODIFIES: words in self
// EFFECTS: remove the word with the specified id
//			return YES if it's successfully removed

-(BOOL)removeWordWithString:(NSString*)theWord;
// MODIFIES: words in self
// EFFECTS: remove the word that matches the specified English Word
//			returns YES if it's successfully removed

@end
