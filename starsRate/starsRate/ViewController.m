//
//  ViewController.m
//  starsRate
//
//  Created by tirostiros on 15/7/10.
//  Copyright (c) 2015年 cn.com.buslink. All rights reserved.
//

#import "ViewController.h"
#import "RateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RateView *rateView = [[RateView alloc] initWithDeaultStar:3 andisModify:YES];
    [self.view addSubview:rateView];
    [rateView setPostion:CGPointMake(100, 300)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
