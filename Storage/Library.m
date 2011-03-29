//
//  Library.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Library.h"
#import <string.h>

@implementation Library

@synthesize words;

CFComparisonResult compareWords(const void *val1, const void *val2, void *context){
// Comparator function to compare two Word object based on the English Word
	Word* word1 = (Word*)val1;
	Word* word2 = (Word*)val2;
	CFComparisonResult result = CFStringCompare((CFStringRef)[word1 englishWord],(CFStringRef)[word2 englishWord],0);
	if(result==0){
		if([word1 wordID]>[word2 wordID]) return 1;
		else if([word1 wordID]<[word2 wordID]) return -1;
		else return 0;
	} else {
		return result;
	}
}

-(id)init{
	[super init];
	if(self!=nil){
		words = [[NSMutableArray alloc] init];
	}
	return self;
}

-(NSInteger)maxID{
	NSInteger max = 0;
	for(int i=0; i<[words count]; i++){
		NSInteger idTaken = [[words objectAtIndex:i] wordID];
		max = ((idTaken>max)?idTaken:max);
	}
	return max;
}

-(BOOL)checkIDConsistency{
	BOOL usedID[[self maxID]];
	memset(usedID,0,sizeof(usedID));
	for(int i=0; i<[words count]; i++){
		NSInteger wordID = [[words objectAtIndex:i] wordID];
		if(usedID[wordID]) return NO;
		usedID[wordID] = YES;
	}
	return YES;
}

-(NSInteger)availableID{
	NSInteger maxID = [self maxID];
	BOOL usedID[maxID+5];
	memset(usedID,0,sizeof(usedID));
	for(int i=0; i<[words count]; i++){
		NSInteger wordID = [[words objectAtIndex:i] wordID];
		usedID[wordID] = YES;
	}
	for(int i=1; i<=maxID; i++){
		if(!usedID[i]) return i;
	}
	return maxID+1;
}

-(NSArray*)availableIDWithCount:(int)count{
	NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:count];
	int tot=0;
	NSInteger maxID = [self maxID];
	BOOL usedID[maxID+5];
	memset(usedID,0,sizeof(usedID));
	for(int i=0; i<[words count]; i++){
		NSInteger wordID = [[words objectAtIndex:i] wordID];
		usedID[wordID] = YES;
	}
	for(int i=1; i<=maxID && tot<count; i++, tot++){
		if(!usedID[i]) [result addObject:[NSNumber numberWithInt:i]];
	}
	return [result autorelease];
}

-(Word*)wordWithID:(NSInteger)wordID{
	int i=0;
	for(i=0; i<[words count]; i++){
		Word* wordTaken = [words objectAtIndex:i];
		if([wordTaken wordID]==wordID) return wordTaken;
	}
	return nil;
}

-(Word*)wordWithString:(NSString*)theWord{
	Word* word = [[Word alloc] initWithID:-1 englishWord:theWord translated:@"" lang:@""];
	NSInteger index = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
															CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
															word,
															(CFComparatorFunction)compareWords,
															NULL);
    if(index>=[words count] || ![[[words objectAtIndex:index] englishWord] isEqual:theWord]){
		return nil;
	} else {
		return [words objectAtIndex:index];
	}
}

-(Word*)addWord:(NSString *)eng translation:(NSString *)trans lang:(NSString *)lang{
	Word* word = [[Word alloc] initWithID:[self availableID] englishWord:eng translated:trans lang:lang];
	NSInteger insertIndex = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
                                                          CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
                                                          word,
                                                          (CFComparatorFunction)compareWords,
                                                          NULL);
    [words insertObject:word atIndex:insertIndex];
	//NSLog(@"Object inserted at index: %d",insertIndex);
	return word;
}

-(int)addWords:(NSArray *)wordList{
	int result = 0;
	//NSArray* availableIDs = [self availableIDWithCount:[wordList count]];
	for(int i=0; i<[wordList count]; i++){
		Word* word = [wordList objectAtIndex:i];
		if([self wordWithID:[word wordID]]) continue;
		NSInteger insertIndex = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
																CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
																word,
																(CFComparatorFunction)compareWords,
																NULL);
		[words insertObject:word atIndex:insertIndex];
		result++;
	}
	return result;
}

-(BOOL)removeWordWithID:(NSInteger)wordID{
	for(int i=0; i<[words count]; i++){
		if([[words objectAtIndex:i] wordID]==wordID){
			[words removeObjectAtIndex:i];
			return YES;
		}
	}
	return NO;
}

-(BOOL)removeWordWithString:(NSString *)theWord{
	Word* word = [self wordWithString:theWord];
	if(word==nil) return NO;
	[words removeObject:word];
	return YES;
}

-(void)dealloc{
	[words release];
	[super dealloc];
}

@end
