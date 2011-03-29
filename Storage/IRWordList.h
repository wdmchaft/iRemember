//
//  IRWordList.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRLibrary.h"
#import "IRWordWithStatistics.h"
#import "IRWordWithStatisticsInGame.h"

@interface IRWordList : IRLibrary {

}

@property(nonatomic,retain) NSString* listName;
@property(nonatomic,retain) NSMutableArray* wordsWithStatistics;
@property(nonatomic,retain) NSMutableArray* wordsWithStatisticsInGame;

@end
