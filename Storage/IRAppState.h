//
//  AppState.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRWordList.h"
#import "IRStudyPlan.h"
#import "IRHeader.h"

@interface IRAppState : NSObject {
	IRWordList* wordsForGame;
}

@property(nonatomic,retain) NSMutableArray* libraries;

+(id)currentState;

-(void)setWordsForGameWithMode:(GameStartMode)mode;
-(IRWordList*)wordsForGame;

@end