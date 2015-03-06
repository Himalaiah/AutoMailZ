//
//  Local.h
//  AutoMail
//
//  Created by Felipe Marques Ramos on 03/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import "SMSViewController.h"
#import "EmailViewController.h"

@interface Local : NSObject

@property NSString *nome;
@property MKCoordinateRegion regiao;
@property MFMessageComposeViewController *sms;
@property MFMailComposeViewController *email;

-(instancetype)init;
-(instancetype)initWithName:(NSString *)nome;

@end
