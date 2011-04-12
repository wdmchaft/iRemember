//
//  IRHeader.h
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
#define NUMBER_REVIEW 6

#define GAME_MCQ @"Multiple Choice Quiz"
#define GAME_HANGMAN @"Hangman"
#define GAME_LISTENING @"Listening Test"

#define GAME_TABLEVIEW_ORIGIN_X 200
#define GAME_TABLEVIEW_ORIGIN_Y 100
#define GAME_TABLEVIEW_WIDTH 500
#define GAME_TABLEVIEW_HEIGHT 500
#define GAME_TABLEVIEW_CELLICON_LENGTH 40
#define GAME_ANIMATION_DURATION 0.8

#define STATISTICS_BAR_HEIGHT 500
#define STATISTICS_BAR_WIDTH 60
#define STATISTICS_BARS_INTERVAL 20
#define STATISTICS_BAR_OFFSET_X 100
#define STATISTICS_BAR_OFFSET_Y 550
#define STATISTICS_XAXIS_LENGTH 530
#define STATISTICS_AXIS_WIDTH 4
#define STATISTICS_YXIS_HEIGHT 460

typedef enum {
	IRGameStartAll = 0,
	IRGameStartStudied = 1,
	IRGameStartDifficult = 2
} IRGameStartMode;