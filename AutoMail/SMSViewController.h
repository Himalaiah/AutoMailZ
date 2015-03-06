//
//  SMSViewController.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Local.h"

@class Local;

@interface SMSViewController : UIViewController



- (IBAction)getContatos:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *contatoNumber;
@property (weak, nonatomic) IBOutlet UITextView *smsText;
@property Local *local;

@end
