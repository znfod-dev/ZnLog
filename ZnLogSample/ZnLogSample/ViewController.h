//
//  ViewController.h
//  ZnLogSample
//
//  Created by 박종현 on 12/08/2019.
//  Copyright © 2019 Znfod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *logTextView;

- (IBAction)buttonClicked:(id)sender;

@end

