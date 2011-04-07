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
#define DEFAULT_LANGUAGE LANG_ENGLISH
#define DEFAULT_TOTAL_DAYS 10
#define DEFAULT_HOUR 9
#define DEFAULT_MINUTE 0
#define MAX_SEARCH_SIZE 1000000

typedef enum {
	IRGameStartAll = 0,
	IRGameStartStudied = 1,
	IRGameStartDifficult = 2
} IRGameStartMode;