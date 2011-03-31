//
//  Library.m
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IRLibrary.h"
#import "IRHeader.h"
#import <string.h>

@implementation IRLibrary

@synthesize words, language;

CFComparisonResult compareWords(const void *val1, const void *val2, void *context){
// Comparator function to compare two Word object based on the English Word
	IRWord* word1 = (IRWord*)val1;
	IRWord* word2 = (IRWord*)val2;
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
	return [self initWithLanguage:DEFAULT_LANGUAGE];
}

-(id)initWithLanguage:(NSString*)lang{
	[super init];
	if(self!=nil){
		[self setLanguage:lang];
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

-(IRWord*)wordWithID:(NSInteger)wordID{
	int i=0;
	for(i=0; i<[words count]; i++){
		IRWord* wordTaken = [words objectAtIndex:i];
		if([wordTaken wordID]==wordID) return wordTaken;
	}
	return nil;
}

-(IRWord*)wordWithString:(NSString*)theWord{
	IRWord* word = [[IRWord alloc] initWithID:-1 englishWord:theWord translated:@"" lang:@""];
	NSInteger index = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
															CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
															word,
															(CFComparatorFunction)compareWords,
															NULL);
	[word release];
    if(index>=[words count] || ![[[words objectAtIndex:index] englishWord] isEqual:theWord]){
		return nil;
	} else {
		return [words objectAtIndex:index];
	}
}

-(IRWord*)addWord:(NSString *)eng translation:(NSString *)trans lang:(NSString *)lang{
	IRWord* word = [[IRWord alloc] initWithID:[self availableID] englishWord:eng translated:trans lang:lang];
	NSInteger insertIndex = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
                                                          CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
                                                          word,
                                                          (CFComparatorFunction)compareWords,
                                                          NULL);
    [words insertObject:word atIndex:insertIndex];
	[word release];
	//NSLog(@"Object inserted at index: %d",insertIndex);
	return [words objectAtIndex:insertIndex];
}

-(NSArray*)addWords:(NSArray *)wordList{
	int result = 0;
	NSMutableArray* unadded = [[[NSMutableArray alloc] init] autorelease];
	for(int i=0; i<[wordList count]; i++){
		IRWord* word = [wordList objectAtIndex:i];
		if([self wordWithID:[word wordID]]!=nil){
			[unadded addObject:word];
			continue;
		}
		NSInteger insertIndex = (NSInteger)CFArrayBSearchValues((CFArrayRef)words,
																CFRangeMake(0, CFArrayGetCount((CFArrayRef)words)),
																word,
																(CFComparatorFunction)compareWords,
																NULL);
		[words insertObject:word atIndex:insertIndex];
		result++;
	}
	return unadded;
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
	IRWord* word = [self wordWithString:theWord];
	if(word==nil) return NO;
	[words removeObject:word];
	return YES;
}

-(NSInteger)count{
	return [words count];
}

-(void)encodeWithCoder:(NSCoder*)coder{
	[coder encodeObject:words forKey:@"words"];
	[coder encodeObject:language forKey:@"language"];
}

-(id)initWithCoder:(NSCoder*)decoder{
	if([super init]!=nil && [self init]!=nil){
		[self setWords:[decoder decodeObjectForKey:@"words"]];
		[self setLanguage:[decoder decodeObjectForKey:@"language"] ];
	}
	return self;
}

-(void)dealloc{
	[words release];
	[super dealloc];
}

@end
