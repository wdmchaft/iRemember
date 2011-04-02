//
//  StorageTest.m
//  iRemember
//
//  Created by Yingbo Zhan on 4/2/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "StorageTest.h"


@implementation StorageTest

- (void) testMath {
    
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
    
}

- (void)testFail
{
	STFail(@"Must fail to succeed");
}




@end
