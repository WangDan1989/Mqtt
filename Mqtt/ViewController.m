//
//  ViewController.m
//  Mqtt
//
//  Created by 15060201 on 16/5/16.
//  Copyright © 2016年 15060201. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app pushTopic];
}

@end
