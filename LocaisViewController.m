//
//  LocaisViewController.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "LocaisViewController.h"

@interface LocaisViewController ()

@end

@implementation LocaisViewController

@synthesize mapa, endereco,locationManager, circle;

- (void)viewDidLoad {
    [super viewDidLoad];
    //ponto
    _ponto=[[MKPointAnnotation alloc]init];
    [_ponto setTitle:@"voce esta aqui meu caro!"];
    
    [endereco setDelegate:self ];
    [mapa setDelegate:self];
    
    
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    
    
    [mapa setRegion:_local.regiao animated:YES];
    circle=[MKCircle circleWithCenterCoordinate:_local.regiao.center radius:self.raioSlider.value];
    [mapa addOverlay:circle];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    _user=[locations lastObject];
    
    _ponto.coordinate=_user.coordinate;
    [mapa  addAnnotation:_ponto];
    
    CLLocationCoordinate2D loc=[[locations lastObject]coordinate];
    
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(loc, 30, 30);
    [mapa setRegion:regiao animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay



{
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:(MKCircle *)overlay];
    circleView.fillColor = [UIColor colorWithRed:0.529 green:0.807 blue:0.98 alpha:0.5];
    return circleView;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
    [theSearchBar resignFirstResponder];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:theSearchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        //Error checking
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        MKCoordinateRegion region;
        region.center.latitude = placemark.location.coordinate.latitude;
        region.center.longitude = placemark.location.coordinate.longitude;
        
        _local.regiao=region;
        [mapa setRegion:region animated:YES];
        CLLocationDistance fenceDistance = self.raioSlider.value;
        _place = CLLocationCoordinate2DMake(region.center.latitude, region.center.longitude);
        circle = [MKCircle circleWithCenterCoordinate:_place radius:fenceDistance];
        [mapa addOverlay: circle];
        
         CLLocation *salvaLugar = [[CLLocation alloc]initWithLatitude:  placemark.location.coordinate.latitude longitude: placemark.location.coordinate.longitude];
        
        [geocoder reverseGeocodeLocation:salvaLugar
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           CLPlacemark *placemark = [placemarks objectAtIndex:0];
                           NSLog(@"placemark %@",placemark);
                           //String to hold address
                           NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                         
                        _labelLocal.text = locatedAt;}
         
         ];
    }];
    
    
     //   CLLocation *salvaLugar = [[CLLocation alloc]initWithLatitude:  placemark.location.coordinate.latitude longitude: placemark.location.coordinate.longitude];
        
        
   /*     [geocoder reverseGeocodeLocation:salvaLugar
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           CLPlacemark *placemark = [placemarks objectAtIndex:0];
                           NSLog(@"placemark %@",placemark);
                           //String to hold address
                           NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                           _labelLocal.text = locatedAt;
   // }];*/
    
    
    
   
                       
}

- (IBAction)mudaRaio:(id)sender {
    [mapa removeOverlay:circle];
    circle=[MKCircle circleWithCenterCoordinate:_local.regiao.center radius:self.raioSlider.value];
    [mapa addOverlay:circle];
}


@end
