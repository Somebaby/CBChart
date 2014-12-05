//
//  ViewController.m
//  CBChart
//
//  Created by pacific on 14/11/28.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "ViewController.h"
#import "CBChartView.h"
#import "CBLineChart.h"


@interface ViewController ()

@property (weak, nonatomic) UIView *bgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    NSString *str = @"as";
//    
//    int temp = [str intValue];
//    
//    if (temp == 0) {
//        NSLog(@"没数字就是0");
//    }
    
    
    
    
    
    CBChartView *chartView = [CBChartView charView];
    [self.view addSubview:chartView];
    
    
    // bug：如果给的数据有0 如何处理
    chartView.xValues = @[@"0",@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    chartView.yValues = @[@"75", @"20", @"90", @"50", @"55", @"60", @"50", @"50", @"34", @"asdf"];
    
//    chartView.frame = CGRectMake(100, 90, 100, 200);
//    chartView.shutDefaultAnimation = YES;
//    [UIView animateWithDuration:1.0 animations:^{
//        chartView.frame = CGRectMake(10, 30, 300, 400);
//    }];
    
}

-(void)bgroudPaint
{
    UIView *bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(10, 100, 300, 300);
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    self.bgView = bgView;
    
    /*
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = bgView.layer.bounds;
    lineLayer.position = CGPointMake(bgView.layer.bounds.size.width * 0.5, bgView.layer.bounds.size.height * 0.5);;
    lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    lineLayer.opacity = 0.5;
    [bgView.layer addSublayer:lineLayer];
     */
    
    // 绘制x轴
    [self drawXlineCoor];
    // 绘制y轴
    [self drawYlineCoor];
}

-(void)drawXlineCoor
{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = self.bgView.frame;
    lineLayer.position = CGPointMake(self.bgView.layer.bounds.size.width * 0.5, self.bgView.layer.bounds.size.height * 0.5);
    
    UIBezierPath *coordinateXPath = [UIBezierPath bezierPath];
    [coordinateXPath moveToPoint:CGPointMake(10, self.bgView.frame.size.height - 10)];
    [coordinateXPath setLineWidth:5.0];
    [coordinateXPath setLineCapStyle:kCGLineCapRound];
    [coordinateXPath setLineJoinStyle:kCGLineJoinRound];
    [coordinateXPath addLineToPoint:CGPointMake(self.bgView.frame.size.width, self.bgView.frame.size.height - 10)];
    [coordinateXPath stroke];
    
   
    lineLayer.path = coordinateXPath.CGPath;
    lineLayer.strokeColor = [UIColor purpleColor].CGColor;
    CABasicAnimation *pathAnimation = [self setUpAnimation];
    [lineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    lineLayer.strokeEnd = 1.0;
    [self.bgView.layer addSublayer:lineLayer];
}

-(void)drawYlineCoor
{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = self.bgView.frame;
    lineLayer.position = CGPointMake(self.bgView.layer.bounds.size.width * 0.5, self.bgView.layer.bounds.size.height * 0.5);
    
    UIBezierPath *coordinateYPath = [UIBezierPath bezierPath];
    [coordinateYPath moveToPoint:CGPointMake(10, self.bgView.frame.size.height - 10)];
    [coordinateYPath setLineWidth:1.0];
    [coordinateYPath setLineCapStyle:kCGLineCapRound];
    [coordinateYPath setLineJoinStyle:kCGLineJoinRound];
    [coordinateYPath addLineToPoint:CGPointMake(10, 0)];
    [coordinateYPath stroke];
    
    lineLayer.strokeColor = [UIColor purpleColor].CGColor;
    lineLayer.path = coordinateYPath.CGPath;
    CABasicAnimation *pathAnimation = [self setUpAnimation];
    [lineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    lineLayer.strokeEnd = 1.0;
    [self.bgView.layer addSublayer:lineLayer];
    
}

// 创建动画
-(CABasicAnimation *)setUpAnimation
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    return pathAnimation;
}
@end
