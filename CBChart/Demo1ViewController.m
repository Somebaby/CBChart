//
//  Demo1ViewController.m
//  CBChart
//
//  Created by pacific on 15/1/6.
//  Copyright (c) 2015年 pacific. All rights reserved.
//

#import "Demo1ViewController.h"
#import "CBChartView.h"

@interface Demo1ViewController ()

@property (weak, nonatomic) CBChartView *chartView;

@property (weak, nonatomic) UISwitch *sw;

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 使用方法
    CBChartView *chartView = [CBChartView charView];
    [self.view addSubview:chartView];
    chartView.xValues = @[@"0",@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    chartView.yValues = @[@"75", @"20", @"90", @"50", @"55", @"60", @"50", @"50", @"34", @"67"];
    chartView.chartColor = [UIColor greenColor];
    self.chartView = chartView;
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(120, 330, 0, 0)];
    [sw addTarget:self action:@selector(switchClick) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
    self.sw = sw;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(40, 330, 50, 30)];
    lab.text = @"网格: ";
    [self.view addSubview:lab];
}


-(void)switchClick
{
    if ([self.sw isOn]) {
        self.chartView.isDrawDashLine = NO;
        [self.chartView setNeedsDisplay];
    }else{
        self.chartView.isDrawDashLine = YES;
        [self.chartView setNeedsDisplay];
    }
}

@end
