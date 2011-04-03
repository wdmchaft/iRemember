//
//  WordWithStatistics.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWord.h"

@interface IRWordWithStatistics : NSObject {

}

@property(nonatomic) NSInteger wordID;
// The wordID this word with statistics refers to

@property(nonatomic,retain) NSArray* reviewDates;
@property(nonatomic) BOOL isStudied;

@end
