//
//  CBBaseChart.m
//  CBChart
//
//  Created by pacific on 14/12/17.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "CBBaseChart.h"

@interface CBBaseChart ()

@end


@implementation CBBaseChart


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    
    // 绘制贝塞尔曲线
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 100, 20);
    CGContextAddQuadCurveToPoint(context, 0, 0, 20, 30);
    CGContextMoveToPoint(context, 20, 30);
    CGContextAddQuadCurveToPoint(context, 0, 0, 40, 60);
    CGContextMoveToPoint(context, 40, 60);
    CGContextAddQuadCurveToPoint(context, 0, 0, 80, 120);
    
//    CGContextMoveToPoint(context, 40, 60);
//    CGContextAddQuadCurveToPoint(context, 0, 0, 80, 120);
    
    [[UIColor purpleColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
}

@end
