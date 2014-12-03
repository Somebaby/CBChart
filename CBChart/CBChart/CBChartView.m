//
//  CBChartView.m
//  CBChart
//
//  Created by pacific on 14/12/1.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "CBChartView.h"
#import "UIView+FrameSet.h"
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/155.0 green:arc4random_uniform(255)/155.0 blue:arc4random_uniform(255)/155.0 alpha:0.7]

#define coorLineWidth 2
#define leftLineMargin 25
#define bottomLineMargin 20
#define coordinateOriginFrame CGRectMake(leftLineMargin, self.height - bottomLineMargin, coorLineWidth, coorLineWidth)  // 原点坐标
#define xCoordinateWidth (self.width - leftLineMargin)
#define yCoordinateHeight (self.height - bottomLineMargin)


@interface CBChartView ()



@end

@implementation CBChartView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


+(instancetype)charView
{
    CBChartView *chartView = [[self alloc] init];
    // 默认值
    chartView.frame = CGRectMake(10, 30, 300, 220);
    return chartView;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 构建坐标系
    [self setUpCoordinateSystem];
    
    // 根据值添加x轴的label
    [self setUpXcoorWithValues:self.xValues];
    // 根据值添加x轴的label
    [self setUpYcoorWithValues:self.yValues];
    
    
}

#pragma mark - 创建坐标系
-(void)setUpCoordinateSystem
{
    UIView *xCoordinate = [self getLineCoor];
    UIView *yCoordinate = [self getLineCoor];
    [self addSubview:xCoordinate];
    [self addSubview:yCoordinate];
    [UIView animateWithDuration:0.4 animations:^{
        xCoordinate.width = xCoordinateWidth;
        yCoordinate.height = -yCoordinateHeight;
    }];
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // 画原点
    CGRect myRect = CGRectMake(2, self.height - bottomLineMargin , leftLineMargin, bottomLineMargin);
    UIFont *font = [UIFont systemFontOfSize:14];
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init]; // 段落样式
    style.alignment = NSTextAlignmentCenter;
    [@"0" drawInRect:myRect withAttributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:style}];
    [self setNeedsDisplay];
    
}

// 得到x y轴坐标系
-(UIView *)getLineCoor
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    lineView.alpha = 0.3;
    lineView.frame = coordinateOriginFrame;
    return lineView;
}

#pragma mark - 添加坐标轴的值
-(void)setUpXcoorWithValues:(NSArray *)values
{
    if (values){
        NSUInteger count = values.count;
        for (int i = 0; i < count; i++) {
            NSString *xValue = values[i];
            UILabel *xLabel = [[UILabel alloc] init];
            xLabel.font = [UIFont systemFontOfSize:14];
            xLabel.alpha = 0.0;
            xLabel.text = xValue;
            [xLabel sizeToFit];
            CGFloat cX = (xCoordinateWidth / count) * (i + 1) + leftLineMargin;
            CGFloat cY = self.height - bottomLineMargin;
            CGFloat width = xLabel.width;
            CGFloat height = xLabel.height;
            xLabel.center = CGPointMake(cX - width * 0.5, cY + height * 0.5);
            [self addSubview:xLabel];
            [UIView animateWithDuration:1 animations:^{
                xLabel.alpha = 1.0;
            }];
        }
    }
}

-(void)setUpYcoorWithValues:(NSArray *)values
{
    if (values) {
        NSUInteger count = values.count;
        NSString *maxValue = values[0];
        for (int i = 1; i < count; i++) {
            if ([maxValue floatValue] < [values[i] floatValue]) {
                maxValue = values[i];
            }
        }
        
        CGFloat scale = [maxValue floatValue] / count;
        for (int i = 0; i < count; i++) {
            UILabel *yLabel = [[UILabel alloc] init];
            yLabel.alpha = 0.0;
            yLabel.font = [UIFont systemFontOfSize:14];
            yLabel.text = [NSString stringWithFormat:@"%.0f-", [maxValue floatValue] - (i * scale)];
            NSLog(@"text: %@", yLabel.text);
            [yLabel sizeToFit];
            CGFloat width = yLabel.width;
            CGFloat height = yLabel.height;
            CGFloat cX = leftLineMargin;
            CGFloat cY = i * (yCoordinateHeight / count);
            yLabel.center = CGPointMake(cX - width * 0.5, cY + height * 0.5);
            [self addSubview:yLabel];
            [UIView animateWithDuration:1 animations:^{
                yLabel.alpha = 1.0;
            }];
        }
    }
}

@end

