//
//  Singleton.m
//  AutoMail
//
//  Created by Felipe Marques Ramos on 06/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

-(instancetype)init{
    self = [super init];
    _locais=[[NSMutableArray alloc] init];
    return self;
}

+(Singleton *)instance{
    static Singleton *singleton=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton= [[self alloc]init];
    });
    return singleton;
}


@end
