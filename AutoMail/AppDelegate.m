//
//  AppDelegate.m
//  AutoMail
//
//  Created by Andre Lucas Ota on 02/03/15.
//  Copyright (c) 2015 Andre Lucas Ota. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//FICA CALCULANDO DISTANCIA DOS LOCAIS. AO ESTAR DENTRO DO RAIO DO CIRCULO E MANDA UMA NOTIFICACAO
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
//    UILocalNotification *notificacao;
//    notificacao.regionTriggersOnce = YES;
//    _singleton = [Singleton instance];
//
//    Local *local = _singleton.locais.lastObject;
//    CLRegion *reg= [[CLRegion alloc]init];
//    [notificacao setRegion: (local.regiao)];
//    
//    [NSNotificationCenter *notification] =
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
//    [SMSViewController ];
//    [local.email apresentarEmail];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
