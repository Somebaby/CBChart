//
//  Demo2ViewController.m
//  CBChart
//
//  Created by pacific on 15/1/6.
//  Copyright (c) 2015年 pacific. All rights reserved.
//

#import "Demo2ViewController.h"
#import "CBChartView.h"

@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 使用
    CBChartView *chartView = [[CBChartView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    chartView.shutDefaultAnimation = YES;
    [self.view addSubview:chartView];
    chartView.xValues = @[@"0",@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    chartView.yValues = @[@"75", @"20", @"90", @"50", @"55", @"60", @"50", @"50", @"34", @"67"];
    chartView.chartWidth = 2.0;
    chartView.chartColor = [UIColor purpleColor];
    
    [UIView animateWithDuration:1 animations:^{
        chartView.frame = CGRectMake(10, 100, 310, 330);
    }];
    
}


@end
