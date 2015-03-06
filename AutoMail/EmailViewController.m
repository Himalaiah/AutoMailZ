//
//  EmailViewController.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "EmailViewController.h"
#import "LocaisViewController.h"

@interface EmailViewController (){
    
}

@end

@implementation EmailViewController

@synthesize destinatarioEmail, assuntoEmail, mensagemEmail, mc;

- (void)viewDidLoad {
    [super viewDidLoad];
    mensagemEmail.layer.borderColor = [[UIColor blackColor] CGColor];
    mensagemEmail.layer.borderWidth = 1.0;
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
    _local.email = mc;
    for (UIViewController *controler in self.navigationController.viewControllers) {
        if ([controler isKindOfClass:[LocaisViewController class]]) {
            [self.navigationController popToViewController:controler animated:YES];
            break;
        }
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
