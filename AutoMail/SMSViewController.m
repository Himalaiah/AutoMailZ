//
//  SMSViewController.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "SMSViewController.h"
#import <AddressBookUI/AddressBookUI.h>
#import <MessageUI/MessageUI.h>
#import "LocaisViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SMSViewController ()

@end

@implementation SMSViewController

@synthesize contatoNumber, smsText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(_local.sms.recipients[0]!=nil){
        [contatoNumber setText:_local.sms.recipients[0]];
    }
    
    if(_local.sms.body != nil){
        [smsText setText:_local.sms.body];
    }
    
    smsText.layer.borderColor = [[UIColor blackColor] CGColor];
    smsText.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getContatos:(id)sender {
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc]init];
    picker.peoplePickerDelegate=self;
    picker.displayedProperties=[NSArray arrayWithObject:[NSNumber numberWithInt:kABPersonPhoneProperty]];
    [self presentViewController:picker animated:YES completion:nil];
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    // ensure user picked a phone property
    if(property == kABPersonPhoneProperty)
    {
        ABMultiValueRef phone = ABRecordCopyValue(person, property);
        self.contatoNumber.text = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, ABMultiValueGetIndexForIdentifier(phone, identifier));
        
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
    }
    else
    /* Display message if selection is not a phone number */
        
        return NO;
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    // Call the delegate method for iOS 7
    [self peoplePickerNavigationController:peoplePicker shouldContinueAfterSelectingPerson:person property:property identifier:identifier];
}

- (IBAction)sendSMS:(id)sender {
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        
    }
    
    NSArray *recipents = @[contatoNumber.text];
    
    NSString *message = [NSString stringWithFormat:smsText.text, nil];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    
    [messageController dismissModalViewControllerAnimated:YES];

    //[  messageController messageComposeDelegate ];

    
    
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    _local.sms = messageController;
    
    //Present message view controller on screen
  //  [self presentViewController:messageController animated:YES completion:nil];
    
   // [self presentViewController:messageController animated:YES completion:nil];
    

    //[messageController messageComposeDelegate];
               // [self dismissViewControllerAnimated:YES completion:nil];
    //messageController = nil;
    
    
    for (UIViewController *controler in self.navigationController.viewControllers) {
        if ([controler isKindOfClass:[LocaisViewController class]]) {
            [self.navigationController popToViewController:controler animated:YES];
            break;
        }
    }
}

- (void) apresentarSMS{
[self presentViewController:_local.sms animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
