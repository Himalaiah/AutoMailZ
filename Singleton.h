//
//  Singleton.h
//  AutoMail
//
//  Created by Felipe Marques Ramos on 06/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property NSMutableArray *locais;

+(Singleton *)instance;
-(instancetype)init;
@end
