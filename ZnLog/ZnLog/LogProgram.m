//
//  LogProgram.m
//  ZnLog
//
//  Created by 박종현 on 2018. 6. 1..
//  Copyright © 2018년 Znfod. All rights reserved.
//

#import "LogProgram.h"
#import "UIDevice+Hardware.h"
#import <UIKit/UIKit.h>
#import <malloc/malloc.h>
#import "Constants.h"

//우선 mylogdoc에 저장을 하고 mylogdoc의 파일크기가 1MB가 넘어가면
//mylogdoc1 ~ mylogdocX 까지 보면서 mylogdocX가 없으면 파일을 복사해서 만든다.

Boolean checkFileSize(NSString *filePath);
void copyAndPaste(NSString *fileContent);
void createFile(NSString *filePath, NSString *fileContent);

void ZnLog(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
    NSLog(@"ZnLog : %@", log);
    
    dispatch_sync(dispatch_queue_create("mylog.record.queue", DISPATCH_QUEUE_SERIAL), ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME(0)];
        
        NSString *dateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:NSDateFormatterFullStyle];
        
        NSString *content = [NSString stringWithFormat:@"%@ %@\n",dateString, log];
        
        NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        [myHandle seekToEndOfFile];
        [myHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
        
        //파일을 크기를 판단한다.
        if (checkFileSize(filePath) == true) {
            //파일크기가 1024 가 넘을때 파일 내용을 가져온다.
            backupFile();
        }
        paths = nil;
        documentsDirectory = nil;
        filePath = nil;
        dateString = nil;
        content = nil;
    });
    
}

//파일을 크기를 판단한다.
Boolean checkFileSize(NSString *filePath) {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (data.length > 1048576) {
        //파일크기가 1024가 넘으면 true
        data = nil;
        return true;
    }else {
        //파일 크기가 1024가 넘지 않으면 false
        data = nil;
        return false;
    }
    
}

void backupFile(void) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    for (int i=10;i>0;i--) {
        NSError *error = nil;
        NSString *preFilePath = [documentsDirectory stringByAppendingString:FILENAME(i-1)];
        NSString *preFileContent = [NSString stringWithContentsOfFile:preFilePath encoding:NSUTF8StringEncoding error:&error];
        NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME(i)];
        [preFileContent writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

void createAllFile(void) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    for (int i=10;i>=0;i--) {
        NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME(i)];
        createFile(filePath, @"");
    }
}

void createFile(NSString *filePath, NSString *fileContent) {
    NSLog(@"createFile : %@", filePath);
    //assign file path directory
    NSString *platform = [[UIDevice currentDevice] platformString];
    long totalMemory = [[UIDevice currentDevice]totalMemory]/1024/1024;
    long userMemory = [[UIDevice currentDevice]userMemory]/1024/1024;
    
    NSString *content = [NSString stringWithFormat:@"%s%s%s\n %@ \n totalMemory : %ld \n userMemory : %ld \n", UPPERBOX, MESSSAGEBOX1, BOTTOMBOX, platform, totalMemory, userMemory];
    content = [content stringByAppendingString:fileContent];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *attr = [NSMutableDictionary dictionaryWithCapacity: 0];
    [fileManager createFileAtPath:filePath contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:attr];
    
}

void removeAllLogFile(void) {
    for(int i=0;i<11;i++) {
        removeLogFile(i);
    }
}

void removeLogFile(int fileNumber) {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingString:FILENAME(fileNumber)];
    
    [fileManager removeItemAtPath:filePath error:nil];
}

NSString* getAllLog(void) {
    NSLog(@"getAllLog");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = @"";
    
    NSString *allLog = [[NSString alloc]init];
    NSLog(@"documentsDirectory : %@", documentsDirectory);
    for (int i=10;i>=0;i--) {
        NSError *error = nil;
        NSLog(@"FILENAME(i) : %@", FILENAME(i));
        filePath = [documentsDirectory stringByAppendingString:FILENAME(i)];
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        NSLog(@"fileContent : %@", fileContent);
        allLog = [allLog stringByAppendingString:fileContent];
    }
    
    return allLog;
}

