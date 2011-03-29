//
//  Word.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Word : NSObject {

}

@property(nonatomic) NSInteger wordID;
@property(nonatomic,retain) NSString* englishWord;
@property(nonatomic,retain) NSString* translatedWord;
@property(nonatomic,retain) NSString* language;
@property(nonatomic,retain) NSString* pronunciation;
@property(nonatomic) NSInteger difficulty;
@property(nonatomic,retain) NSString* example;
@property(nonatomic,retain) NSString* explanation;
@property(nonatomic,retain) NSString* soundFileName;

-(id)initWithID:(NSInteger)wordId englishWord:(NSString*)eng translated:(NSString*)trans lang:(NSString*)lang;

@end
