//
//  Local.m
//  AutoMail
//
//  Created by Felipe Marques Ramos on 03/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "Local.h"

@implementation Local

-(instancetype)init{
    self=[super init];
    _nome=@"";
    [self pegarLocal];
    return self;
}

-(instancetype)initWithName:(NSString *)nome{
    self=[super init];
    _nome=nome;
    [self pegarLocal];
    return self;
}

-(void)pegarLocal{
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    _regiao = MKCoordinateRegionMakeWithDistance([[locationManager location] coordinate], 30, 30);
    [locationManager stopUpdatingLocation];
}
@end
