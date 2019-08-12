//
//  ViewController.m
//  ZnLogSample
//
//  Created by 박종현 on 12/08/2019.
//  Copyright © 2019 Znfod. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0;i<10000;i++) {
            //NSLog(@"Number(%d) = %d", i, i);
            ZnLog(@"Number(%d) = %d", i, i);
        }
    });
    
}

- (IBAction)buttonClicked:(id)sender {
    NSLog(@"buttonClicked");
    //Configure path package name
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleName = [NSString stringWithFormat:@"%@", [info objectForKey:@"CFBundleDisplayName"]];
    NSLog(@"bundleName : %@", bundleName);
    NSString *path = [NSString stringWithFormat: @"ios/%@/log/txts/", bundleName];
    NSLog(@"path : %@", path);
    
    //Configure filename = 현재날짜시간/iOS버전/iphone종류/랜덤1000/
    // 현재날짜시간
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"date : %@", date);
    // iOS버전
    NSString *system = [NSString stringWithFormat:@"%@%@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
    NSLog(@"version : %@", [[UIDevice currentDevice] systemVersion]);
    NSLog(@"systemName : %@", [[UIDevice currentDevice] systemName]);
    NSLog(@"system : %@", system);
    // iphone종류
    NSString *platform = [[UIDevice currentDevice] platformString];
    NSLog(@"platform : %@", platform);
    // 랜덤1000
    int value = arc4random_uniform(1000);
    NSString *random = [NSString stringWithFormat:@"%d", value];
    NSLog(@"random : %@", random);
    //NSString *version = [[UIDevice currentDevice] systemVersion];
    
    NSString *filename = [NSString stringWithFormat:@"%@_%@_%@_%@", date, system, platform, random];
    filename = [filename stringByReplacingOccurrencesOfString:@" " withString:@""];
    filename = [filename stringByReplacingOccurrencesOfString:@"." withString:@""];
    filename = [filename stringByAppendingString:@".txt"];
    NSLog(@"filename : %@", filename);
    
    
    NSString *content = getAllLog();
    
    [self.logTextView setText:content];
    
}

@end
