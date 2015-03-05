//
//  LocaisViewController.h
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Local.h"
#import <MapKit/MapKit.h>

@interface LocaisViewController : UIViewController <CLLocationManagerDelegate, UISearchBarDelegate, MKMapViewDelegate>{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) MKCircle *circle;
@property  CLLocationCoordinate2D place;
@property CLLocation *user;
@property MKPointAnnotation *ponto;
@property (strong,nonatomic)CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISearchBar *endereco;
@property (strong, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UISlider *raioSlider;



-(void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *labelLocal;



@property Local *local;

@end
