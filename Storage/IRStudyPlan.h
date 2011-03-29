//
//  StudyPlan.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "WordWithStatistics.h"
#import "WordWithStatisticsInGame.h"

@interface StudyPlan : NSObject {

}

@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSMutableArray* wordsWithStatistics;
@property(nonatomic,retain) NSMutableArray* plannedReviewDates;
@property(nonatomic,retain) NSMutableArray* actualReviewDates;
@property(nonatomic,retain) NSMutableArray* wordsWithStatisticsInGame; // This one seems redundant
@property(nonatomic) NSInteger elapsedDay;

@end
