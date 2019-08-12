//
//  LogProgram.h
//  ZnLog
//
//  Created by 박종현 on 2018. 6. 1..
//  Copyright © 2018년 Znfod. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void ZnLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;
FOUNDATION_EXPORT void createAllFile(void);
FOUNDATION_EXPORT void removeAllLogFile(void);
FOUNDATION_EXPORT void removeLogFile(int fileNumber);
FOUNDATION_EXPORT void backupFile(void);

FOUNDATION_EXPORT NSString* getAllLog(void);

