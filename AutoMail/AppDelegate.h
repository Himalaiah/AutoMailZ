//
//  AppDelegate.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocaisViewController.h"
#import <AudioToolbox/AudioServices.h>
#import "Local.h"
#import "Singleton.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property Singleton *singleton;

@end

