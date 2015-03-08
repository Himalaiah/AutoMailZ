//
//  Index.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocaisViewController.h"
#import "LocalTableViewCell.h"
#import "Singleton.h"
#import "Local.h"
#import "AppDelegate.h"

@interface Index : UITableViewController

@property Singleton *singleton;

- (IBAction)createNew:(id)sender;

@end
