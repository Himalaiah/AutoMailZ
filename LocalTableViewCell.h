//
//  LocalTableViewCell.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Local.h"

@interface LocalTableViewCell : UITableViewCell

@property Local *local;
@property (weak, nonatomic) IBOutlet UILabel *nomeLocal;


@end
