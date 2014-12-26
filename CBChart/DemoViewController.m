//
//  DemoViewController.m
//  CBChart
//
//  Created by pacific on 14/12/26.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "DemoViewController.h"
#import "CBChart/CBChartView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 使用方法
    CBChartView *chartView = [[CBChartView alloc] initWithFrame:CGRectMake(10, 120, 200, 200)]; // 默认有自己的frame
    [self.view addSubview:chartView];
    
    chartView.xValues = @[@"0",@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    chartView.yValues = @[@"75", @"20", @"90", @"50", @"55", @"60", @"50", @"50", @"34", @"67"];
    
    // 可以关闭自己内部的隐式动画  自己做动画
    chartView.chartColor = [UIColor blackColor];
    
}

@end
