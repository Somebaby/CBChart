//
//  CBBgLayer.m
//  CBChart
//
//  Created by pacific on 14/12/4.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "CBBgLayer.h"

//#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/155.0 green:arc4random_uniform(255)/155.0 blue:arc4random_uniform(255)/155.0 alpha:0.7]
//
//#define coorLineWidth 2
//#define leftLineMargin 25
//#define bottomLineMargin 20
//#define coordinateOriginFrame CGRectMake(leftLineMargin, self.height - bottomLineMargin, coorLineWidth, coorLineWidth)  // 原点坐标
//#define xCoordinateWidth (self.width - leftLineMargin - 5)
//#define yCoordinateHeight (self.height - bottomLineMargin - 5)

@interface CBBgLayer ()

@property (strong, nonatomic) NSDictionary   *textStyleDict;

@end

@implementation CBBgLayer
//
//-(void)drawInContext:(CGContextRef)ctx
//{
//    
//}
//
//#pragma mark - 创建坐标系
//-(void)setUpCoordinateSystem
//{
//    
//    CGRect myRect = CGRectMake(2, self.height - bottomLineMargin + 3 , leftLineMargin, bottomLineMargin);
//    [@"0" drawInRect:myRect withAttributes:self.textStyleDict];
//    // 根据值画x/y轴的值
//    [self setUpXcoorWithValues:self.xValues];
//    [self setUpYcoorWithValues:self.yValues];
//    // 绘制网格
//    [self drawDashLine];
//}
//
//// 绘制网格
//-(void)drawDashLine
//{
//    CGPoint maxXPoint = [[self.xPoints lastObject] CGPointValue];
//    CGPoint minYPoint = [[self.yPoints firstObject] CGPointValue];
//    CGFloat dashLineWidth = 0.5;
//    // 画竖虚线
//    for (NSValue *xP in self.xPoints) {
//        CGPoint xPoint = [xP CGPointValue];
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPathMoveToPoint(path, nil, xPoint.x , xPoint.y);
//        CGPathAddLineToPoint(path, nil, xPoint.x , minYPoint.y);
//        CGContextAddPath(ctx, path);
//        
//        // 上下文形态
//        CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
//        CGContextSetLineWidth(ctx, dashLineWidth);
//        CGContextSetLineCap(ctx, kCGLineCapRound);
//        CGContextSetAlpha(ctx, 0.2);
//        // 虚线
//        CGFloat lengths[2] = {13, 8};
//        CGContextSetLineDash(ctx, 0, lengths, 2);
//        CGContextDrawPath(ctx, kCGPathEOFillStroke);
//        CGPathRelease(path);
//    }
//    
//    // 画横虚线
//    for (NSValue *yP in self.yPoints) {
//        CGPoint yPoint = [yP CGPointValue];
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPathMoveToPoint(path, nil, yPoint.x, yPoint.y );
//        CGPathAddLineToPoint(path, nil, maxXPoint.x - 5, yPoint.y );
//        CGContextAddPath(ctx, path);
//        
//        // 上下文形态
//        CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
//        CGContextSetLineWidth(ctx, dashLineWidth);
//        CGContextSetLineCap(ctx, kCGLineCapRound);
//        CGContextSetAlpha(ctx, 0.2);
//        // 虚线
//        CGFloat lengths[2] = {8, 4};
//        CGContextSetLineDash(ctx, 0, lengths, 2);
//        CGContextDrawPath(ctx, kCGPathEOFillStroke);
//        CGPathRelease(path);
//    }
//}
//
//
//
//#pragma mark - 添加坐标轴的值
//-(void)setUpXcoorWithValues:(NSArray *)values
//{
//    if (values){
//        NSUInteger count = values.count;
//        for (int i = 0; i < count; i++) {
//            NSString *xValue = values[i];
//            CGFloat cX = (xCoordinateWidth / count) * (i + 1) + leftLineMargin;
//            CGFloat cY = self.height - bottomLineMargin;
//            // 收集坐标点 x值递增
//            CGPoint xPoint = CGPointMake(cX, cY);
//            [self.xPoints addObject:[NSValue valueWithCGPoint:xPoint]];
//            CGSize size = [xValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textStyleDict context:nil].size;
//            [xValue drawAtPoint:CGPointMake(cX - size.width * 0.7, cY + 5) withAttributes:self.textStyleDict];
//        }
//    }
//}
//
//-(void)setUpYcoorWithValues:(NSArray *)values
//{
//    if (values) {
//        NSUInteger count = values.count;
//        NSString *maxValue = values[0];
//        for (int i = 1; i < count; i++) {
//            if ([maxValue floatValue] < [values[i] floatValue]) {
//                maxValue = values[i];
//            }
//        }
//        
//        CGFloat scale = [maxValue floatValue] / count;
//        for (int i = 0; i < count; i++) {
//            NSString *yValue = [NSString stringWithFormat:@"%.0f", [maxValue floatValue] - (i * scale)];
//            CGFloat cX = leftLineMargin;
//            CGFloat cY = i * (yCoordinateHeight / count) + 5;
//            // 收集坐标点 y值递减
//            CGPoint yPoint = CGPointMake(cX, cY);
//            [self.yPoints addObject:[NSValue valueWithCGPoint:yPoint]];
//            CGSize size = [yValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textStyleDict context:nil].size;
//            [yValue drawAtPoint:CGPointMake(cX - size.width - 5, cY - size.height * 0.5) withAttributes:self.textStyleDict];
//        }
//    }
//}
@end
