//
//  EmailViewController.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface EmailViewController : UIViewController{
    MFMailComposeViewController *mc;
}
@property MFMailComposeViewController *mc;
@property (weak, nonatomic) IBOutlet UITextField *destinatarioEmail;
@property (weak, nonatomic) IBOutlet UITextField *assuntoEmail;
@property (weak, nonatomic) IBOutlet UITextView *mensagemEmail;
- (IBAction)setEmail:(id)sender;

@end
