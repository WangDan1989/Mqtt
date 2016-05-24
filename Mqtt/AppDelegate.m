//
//  AppDelegate.m
//  Mqtt
//
//  Created by 15060201 on 16/5/16.
//  Copyright © 2016年 15060201. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)pushTopic {
    [_session publishData:[@"Sample Data" dataUsingEncoding:NSUTF8StringEncoding]
                  onTopic:@"/SH/S2H/SpO2083205"
                      retain:YES
                         qos:MQTTQosLevelAtLeastOnce
              publishHandler:^(NSError *error){
                  if (error) {
                      NSLog(@"Subscription failed %@", error.localizedDescription);
                  } else {
                      NSLog(@"Publish sucessfull!");
                  }
              }];
}

- (void)deleteTopic {
    [_session unsubscribeTopic:@"/SH/S2H/SpO2083205" unsubscribeHandler:^(NSError *error) {
        
    }];
}


#pragma mark - MQTTSessionDelegate -

- (void)handleEvent:(MQTTSession *)session
              event:(MQTTSessionEvent)eventCode
              error:(NSError *)error {
    NSLog(@"handleEvent:event:error:");
}

- (void)newMessage:(MQTTSession *)session
              data:(NSData *)data
           onTopic:(NSString *)topic
               qos:(MQTTQosLevel)qos
          retained:(BOOL)retained
               mid:(unsigned int)mid {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"newMessage:data:onTopic:qos:retained:mid:  %@",str);
}

#pragma mark - AppDelegate -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.viewController = [[ViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    NSLog(@"application:didFinishLaunchingWithOptions:");
    
    MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    transport.host = @"";
    transport.port = 1883;
    _session = [[MQTTSession alloc] init];
    _session.transport = transport;
    _session.delegate = self;
    [_session connectAndWaitTimeout:10];

    [_session subscribeToTopic:@"/SH/S2H/SpO2083205" atLevel:MQTTQosLevelAtLeastOnce subscribeHandler:^(NSError *error, NSArray<NSNumber *> *gQoss){
        if (error) {
            NSLog(@"Subscription failed %@", error.localizedDescription);
        } else {
            NSLog(@"Subscription sucessfull! Granted Qos: %@", gQoss);
        }
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
