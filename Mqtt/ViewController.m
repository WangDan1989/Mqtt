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
    
    UIButton *send = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)/2.0, CGRectGetWidth(self.view.frame)/2.0)];
    send.tag = 100;
    send.backgroundColor = [UIColor greenColor];
    [send setTitle:@"Send" forState:UIControlStateNormal];
    [send setTitle:@"Send" forState:UIControlStateHighlighted];
    [send setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [send setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [send addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:send];
    
    UIButton *delete = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2.0, 0, CGRectGetWidth(self.view.frame)/2.0, CGRectGetWidth(self.view.frame)/2.0)];
    delete.tag = 101;
    delete.backgroundColor = [UIColor yellowColor];
    [delete setTitle:@"Delete" forState:UIControlStateNormal];
    [delete setTitle:@"Delete" forState:UIControlStateHighlighted];
    [delete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [delete setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [delete addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delete];
    
}

- (void)click:(UIButton *)sender {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (sender.tag == 100) {
        [app pushTopic];
    } else if (sender.tag == 101) {
        [app deleteTopic];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
