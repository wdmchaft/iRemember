//
//  StorageTest.m
//  iRemember
//
//  Created by Yingbo Zhan on 4/2/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "StorageTest.h"
#import "IRWord.h"

@implementation StorageTest


- (void) setUp
{
	//It will be the caller's responsibility to ensure the input argument to be correct
	word1 = [[IRWord alloc]initWithID:1 englishWord:@"a" translated:@"first character in alphabet" lang:LANG_ENGLISH];
	word2 = [[IRWord alloc]initWithID:2 englishWord:@"b" translated:@"第二个字母" lang:LANG_CHINESE];
	word3 = [[IRWord alloc]initWithID:3 englishWord:@"c" translated:@"huruf ketiga" lang:LANG_INDONESIAN];
	word4 = [[IRWord alloc]initWithID:4 englishWord:@"" translated:@"first character in alphabet" lang:LANG_ENGLISH];
	word5 = [[IRWord alloc]initWithID:5 englishWord:@"e" translated:@"" lang:LANG_ENGLISH];
}

	
- (void) testPass
{
	CGFloat a = 1.0;
	CGFloat b = 1.0;
	STAssertTrue(a==b,@"Must fail to succeed");
}

- (void) testPass2
{
	STAssertTrue(1==1,@"Pass");
}

-(void) testFail{
	STAssertFalse(FALSE,@"FAIL!!");
}

@end
