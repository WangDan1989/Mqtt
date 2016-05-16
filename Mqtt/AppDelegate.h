//
//  AppDelegate.h
//  Mqtt
//
//  Created by 15060201 on 16/5/16.
//  Copyright © 2016年 15060201. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <MQTTClient/MQTTClient.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,MQTTSessionDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ViewController *viewController;

@property (nonatomic, strong) MQTTSession *session;

- (void)pushTopic;

@end

