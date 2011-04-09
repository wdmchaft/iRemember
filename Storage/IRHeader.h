//
//  IRConstants.h
//  iRemember
//
//  Created by Aldrian Obaja Muis on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define LANG_CHINESE @"Chinese"
#define LANG_ENGLISH @"English"
#define LANG_INDONESIAN @"Indonesian"
#define DEFAULT_LANGUAGE LANG_CHINESE
#define DEFAULT_STUDYPLAN @"iRemember Study Plan"
#define DEFAULT_TOTAL_DAYS 10
#define DEFAULT_HOUR 9
#define DEFAULT_MINUTE 0
#define MAX_SEARCH_SIZE 1000000

#define GAME_MCQ @"Multiple Choice Quiz"
#define GAME_HANGMAN @"Hangman"
#define GAME_LISTENING @"Listening Test"

typedef enum {
	IRGameStartAll = 0,
	IRGameStartStudied = 1,
	IRGameStartDifficult = 2
} IRGameStartMode;