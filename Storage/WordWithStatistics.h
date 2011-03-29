//
//  WordWithStatistics.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordWithStatistics : NSObject {

}

@property(nonatomic) NSInteger wordID;
@property(nonatomic,retain) NSArray* reviewDates;
@property(nonatomic) BOOL isStudied;

@end
