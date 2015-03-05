//
//  EmailViewController.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController (){
    
}

@end

@implementation EmailViewController

MFMailComposeViewController *mc;

@synthesize destinatarioEmail, assuntoEmail, mensagemEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setEmail:(id)sender {
    mc = [[MFMailComposeViewController alloc] init];
    NSArray *destin = [NSArray arrayWithObjects:[destinatarioEmail text], nil];
    [mc setSubject:[assuntoEmail text]];
    [mc setMessageBody:[mensagemEmail text] isHTML:NO];
    [mc setToRecipients:destin];
}
@end
