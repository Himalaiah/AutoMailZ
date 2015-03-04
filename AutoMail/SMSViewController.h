//
//  SMSViewController.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SMSViewController : UIViewController


- (IBAction)getContatos:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *contatoNumber;

@end
