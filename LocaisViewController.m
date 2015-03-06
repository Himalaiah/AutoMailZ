//
//  LocaisViewController.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "LocaisViewController.h"
#import "MensagemViewController.h"

@interface LocaisViewController ()

@end

@implementation LocaisViewController

@synthesize mapa, endereco,locationManager, circle,E,W,S,N;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog (@"%@", _local);
    //ponto
    _ponto=[[MKPointAnnotation alloc]init];
    [_ponto setTitle:@"voce esta aqui meu caro!"];
    _ponto.coordinate=_local.regiao.center;
    [mapa  addAnnotation:_ponto];
    //pontos em volta
    E=[[MKPointAnnotation alloc]init];
    W=[[MKPointAnnotation alloc]init];
    N=[[MKPointAnnotation alloc]init];
    S=[[MKPointAnnotation alloc]init];
    
    
    [endereco setDelegate:self ];
    [mapa setDelegate:self];
    
    
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    
    
    [mapa setRegion:_local.regiao animated:YES];
    circle=[MKCircle circleWithCenterCoordinate:_local.regiao.center radius:self.raioSlider.value];
    [mapa addOverlay:circle];
    
    //_labelLocal.text=_local.nome;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //marca onde o usuario esta
    [mapa  removeAnnotation:_user];
    _user=[locations lastObject];
    
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(_local.regiao.center, 30, 30);
    [mapa setRegion:regiao animated:YES];
    
    //verifica se chegou ao local
    
    if (_user.coordinate.longitude>=W.coordinate.longitude && _user.coordinate.longitude<=E.coordinate.longitude && _user.coordinate.latitude >= S.coordinate.latitude && _user.coordinate.latitude <= N.coordinate.latitude) {
        
        UIAlertController *chegou= [UIAlertController alertControllerWithTitle:@"Alerta" message:@"voce chegou ao destino" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        }];
        
        
        
    }
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"toSome"]){
        MensagemViewController *mensagem =[segue destinationViewController];
        
        mensagem.local=_local;
    }
}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay



{
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:(MKCircle *)overlay];
    circleView.fillColor = [UIColor colorWithRed:0.47 green:0.803 blue:0.666 alpha:0.5];
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
        [mapa  removeAnnotation:_ponto];
        [mapa  removeAnnotation:_user];
        [mapa removeOverlay:circle];
        _local.regiao=region;
        _ponto.coordinate=_local.regiao.center;
        [mapa  addAnnotation:_ponto];
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
                           _local.nome= locatedAt;
                           _labelLocal.text=_local.nome;
                       }
         
         ];
    }];
}

- (IBAction)mudaRaio:(id)sender {
    [mapa removeOverlay:circle];
    circle=[MKCircle circleWithCenterCoordinate:_local.regiao.center radius:self.raioSlider.value];
    [mapa addOverlay:circle];
}


- (IBAction)setLocation:(id)sender {
    float raio = self.raioSlider.value/100000;
    E.coordinate = CLLocationCoordinate2DMake(_ponto.coordinate.latitude, _ponto.coordinate.longitude + raio);
    W.coordinate = CLLocationCoordinate2DMake(_ponto.coordinate.latitude, _ponto.coordinate.longitude - raio);
    S.coordinate = CLLocationCoordinate2DMake(_ponto.coordinate.latitude - raio, _ponto.coordinate.longitude );
    N.coordinate = CLLocationCoordinate2DMake(_ponto.coordinate.latitude+ raio, _ponto.coordinate.longitude);
    
   

    
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init]; //alocando glgceocoder para transformar cordenadas em endereço
    
    CLLocation *salvaLugar = [[CLLocation alloc]initWithLatitude:_user.coordinate.latitude longitude:_user.coordinate.longitude];
    NSString *lugarSalvo; //instanciando cclocation para pegar a loc atual no mapa e usar ele para decodificar em endereço
    
    [ceo reverseGeocodeLocation:salvaLugar
              completionHandler:^(NSArray *placemarks, NSError *error) {
                  CLPlacemark *placemark = [placemarks objectAtIndex:0];
                  NSLog(@"placemark %@",placemark);
                  //String to hold address
                  NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
              
                  
                  UIAlertController* chegou = [UIAlertController alertControllerWithTitle:@"Você marcou este lugar"
                                               
                                                                                  message:locatedAt preferredStyle:UIAlertControllerStyleAlert];
                  
                  UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) { 
                                                                 
                                                                 [mapa addAnnotation:E];
                                                                 [mapa addAnnotation:W];
                                                                 [mapa addAnnotation:S];
                                                                 [mapa addAnnotation:N];
                                                                 [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                                                  target:self
                                                                                                selector:@selector(somePontos)
                                                                                                userInfo:nil
                                                                                                 repeats:NO];
                                                             }];
                  [chegou addAction:ok];
                  
                  [self presentViewController:chegou animated:YES completion:nil];
              }
     
     
     
     ];
    
    
   

    
    
    

    
    
    
    
    
}

-(void)somePontos{
  [mapa removeAnnotation:S];
  [mapa removeAnnotation:W];
  [mapa removeAnnotation:E];
  [mapa removeAnnotation:N];
    NSLog(@"teste");
}
@end
