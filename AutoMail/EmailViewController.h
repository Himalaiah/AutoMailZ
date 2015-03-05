//
//  EmailViewController.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *destinatarioEmail;
@property (weak, nonatomic) IBOutlet UITextField *assuntoEmail;
@property (weak, nonatomic) IBOutlet UITextView *mensagemEmail;

@end
