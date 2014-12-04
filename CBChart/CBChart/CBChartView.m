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
#define bottomLineMargin 20
#define coordinateOriginFrame CGRectMake(self.leftLineMargin, self.height - bottomLineMargin, coorLineWidth, coorLineWidth)  // 原点坐标
#define xCoordinateWidth (self.width - self.leftLineMargin - 5)
#define yCoordinateHeight (self.height - bottomLineMargin - 5)


@interface CBChartView ()

// 虚线网格layer
@property (weak, nonatomic)   CALayer        *bgLayer;
@property (strong, nonatomic) NSMutableArray *xPoints;
@property (strong, nonatomic) NSMutableArray *yPoints;
@property (strong, nonatomic) NSDictionary   *textStyleDict;

// 左边间距要根据具体的值去计算
@property (assign, nonatomic) CGFloat leftLineMargin;
@property (assign, nonatomic) BOOL islineDrawDone;

@end

@implementation CBChartView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
//        self.layer.backgroundColor = [UIColor purpleColor].CGColor;
//        self.layer.opacity = 0.4;
        self.isDrawDashLine = YES;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.isDrawDashLine = YES;
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
    if (!self.shutDefaultAnimation) {
        [self setUpCoordinateSystem];
    }
    
}

-(void)setYValues:(NSArray *)yValues
{
    _yValues = yValues;
    
    // 算出合理的左边距
    CGFloat maxStrWidth = 0;
    for (NSString *yValue in yValues) {
        CGSize size = [yValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textStyleDict context:nil].size;
        // 得到文本的最大宽度
        if (size.width > maxStrWidth) {
            maxStrWidth = size.width;
        }
    }
    self.leftLineMargin = maxStrWidth + 6;
}



-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.shutDefaultAnimation) {
        [self drawCoordinateXy];
        [self drawCoorPointAndDashLine];
    }
    
    if (self.islineDrawDone) {
        [self drawCoorPointAndDashLine];
    }
}

#pragma mark - 懒加载
-(NSMutableArray *)xPoints
{
    if (!_xPoints) {
        _xPoints = [NSMutableArray array];
    }
    return _xPoints;
}

-(NSMutableArray *)yPoints
{
    if (!_yPoints) {
        _yPoints = [NSMutableArray array];
    }
    return _yPoints;
}

-(NSDictionary *)textStyleDict
{
    if (!_textStyleDict) {
        UIFont *font = [UIFont systemFontOfSize:14];
        NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init]; // 段落样式
        style.alignment = NSTextAlignmentCenter;
        _textStyleDict = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    }
    return _textStyleDict;
}


#pragma mark - 创建坐标系
-(void)setUpCoordinateSystem // 利用UIView动态画出坐标系
{
    
    UIView *xCoordinate = [self getLineCoor];
    UIView *yCoordinate = [self getLineCoor];
    [self addSubview:xCoordinate];
    [self addSubview:yCoordinate];
    [UIView animateWithDuration:0.3 animations:^{
        xCoordinate.width = xCoordinateWidth + 2;
        yCoordinate.height = -yCoordinateHeight -2;
    } completion:^(BOOL finished) {
        self.islineDrawDone = YES;
        [self createAnimation];
        [self setNeedsDisplay];
    }];
    
//    xCoordinate.width = xCoordinateWidth + 2;
//    yCoordinate.height = -yCoordinateHeight - 2;
    
    
//    CAShapeLayer *xLineLayer = [self getLineCoorBylayer];
//    CAShapeLayer *yLineLayer = [self getLineCoorBylayer];
//    [self.layer addSublayer:xLineLayer];
//    [self.layer addSublayer:yLineLayer];
//    xLineLayer.bounds = CGRectMake(0, 0, xCoordinateWidth + 2, coorLineWidth);
//    yLineLayer.bounds = CGRectMake(0, 0, coorLineWidth, -yCoordinateHeight - 2);
//    self.islineDrawDone = YES;
//    [self createAnimation];
//    [self setNeedsDisplay];
}



-(void)drawCoorPointAndDashLine
{
    CGRect myRect = CGRectMake(2, self.height - bottomLineMargin + 4 , self.leftLineMargin, bottomLineMargin);
    [@"0" drawInRect:myRect withAttributes:self.textStyleDict];
    // 根据值画x/y轴的值
    [self setUpXcoorWithValues:self.xValues];
    [self setUpYcoorWithValues:self.yValues];
    if (self.isDrawDashLine) {
        // 绘制网格
        [self drawDashLine];
    }
    // 画曲线
    [self drawFuncLine];
}

-(void)drawFuncLine
{
    if (self.xValues.count != 0 && self.yValues.count != 0) {
        
    }
}

// 绘制网格
-(void)drawDashLine
{
    if (self.xPoints.count != 0 && self.yPoints.count != 0) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGPoint maxXPoint = [[self.xPoints lastObject] CGPointValue];
        CGPoint minYPoint = [[self.yPoints firstObject] CGPointValue];
        
        // 设置上下文环境 属性
        CGFloat dashLineWidth = 1;
        [[UIColor lightGrayColor] setStroke];
        CGContextSetLineWidth(ctx, dashLineWidth);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetAlpha(ctx, 0.6);
        CGFloat alilengths[2] = {5, 3};
        CGContextSetLineDash(ctx, 0, alilengths, 2);
        // 画竖虚线
        for (NSValue *xP in self.xPoints) {
            CGPoint xPoint = [xP CGPointValue];
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, nil, xPoint.x, xPoint.y);
            CGPathAddLineToPoint(path, nil, xPoint.x, minYPoint.y);
            CGContextAddPath(ctx, path);
            CGContextDrawPath(ctx, kCGPathEOFillStroke);
            CGPathRelease(path);
        }
        // 画横虚线
        for (NSValue *yP in self.yPoints) {
            CGPoint yPoint = [yP CGPointValue];
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, nil, yPoint.x, yPoint.y );
            CGPathAddLineToPoint(path, nil, maxXPoint.x - 5, yPoint.y );
            CGContextAddPath(ctx, path);
            CGContextDrawPath(ctx, kCGPathEOFillStroke);
            CGPathRelease(path);
        }
    }
    
}

// 得到x y轴坐标轴
-(UIView *)getLineCoor
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    lineView.alpha = 0.3;
    lineView.frame = CGRectMake(self.leftLineMargin, self.height - bottomLineMargin, coorLineWidth, coorLineWidth);
    return lineView;
}
// 通过layer画坐标轴
//-(CAShapeLayer *)getLineCoorBylayer
//{
//    CAShapeLayer *lineLayer = [[CAShapeLayer alloc] init];
//    lineLayer.backgroundColor = [UIColor blackColor].CGColor;
//    lineLayer.opacity = 0.3;
//    lineLayer.bounds = coordinateOriginFrame;
//    lineLayer.position = CGPointMake(self.leftLineMargin, yCoordinateHeight + 10);
//    lineLayer.anchorPoint = CGPointMake(0, 1);
//    return lineLayer;
//}

// 用coreGraphics 画坐标轴
-(void)drawCoordinateXy
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef xPath = CGPathCreateMutable();
    CGPathMoveToPoint(xPath, nil, self.leftLineMargin, self.height - bottomLineMargin);
    CGPathAddLineToPoint(xPath, nil, self.leftLineMargin + xCoordinateWidth + 2, self.height - bottomLineMargin);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetAlpha(ctx, 0.6);
    CGContextAddPath(ctx, xPath);
    CGContextDrawPath(ctx, kCGPathStroke);
    CGPathRelease(xPath);
    
    CGMutablePathRef yPath = CGPathCreateMutable();
    CGPathMoveToPoint(yPath, nil, self.leftLineMargin, self.height - bottomLineMargin);
    CGPathAddLineToPoint(yPath, nil, self.leftLineMargin, self.height - bottomLineMargin - yCoordinateHeight -2);
    CGContextAddPath(ctx, yPath);
    CGContextDrawPath(ctx, kCGPathStroke);
    CGPathRelease(yPath);
    
}

#pragma mark - 添加坐标轴的值
-(void)setUpXcoorWithValues:(NSArray *)values
{
    if (values.count){
        NSUInteger count = values.count;
        for (int i = 0; i < count; i++) {
            NSString *xValue = values[i];
            CGFloat cX = (xCoordinateWidth / count) * (i + 1) + self.leftLineMargin;
            CGFloat cY = self.height - bottomLineMargin;
            CGSize size = [xValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textStyleDict context:nil].size;
            [xValue drawAtPoint:CGPointMake(cX - size.width * 0.7, cY + 5) withAttributes:self.textStyleDict];
            // 收集坐标点
            [self.xPoints addObject:[NSValue valueWithCGPoint:CGPointMake(cX, cY)]];
        }
    }
}

-(void)setUpYcoorWithValues:(NSArray *)values
{
    if (values.count) {
        NSUInteger count = values.count;
        NSString *maxValue = values[0];
        for (int i = 1; i < count; i++) {
            if ([maxValue floatValue] < [values[i] floatValue]) {
                maxValue = values[i];
            }
        }
        CGFloat scale = [maxValue floatValue] / count;
        for (int i = 0; i < count; i++) {
            NSString *yValue = [NSString stringWithFormat:@"%.0f", [maxValue floatValue] - (i * scale)];
            CGFloat cX = self.leftLineMargin;
            CGFloat cY = i * (yCoordinateHeight / count) + 5;
            CGSize size = [yValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.textStyleDict context:nil].size;
            [yValue drawAtPoint:CGPointMake(cX - size.width - 5, cY - size.height * 0.5 + 1) withAttributes:self.textStyleDict];
            
            // 收集坐标点
            [self.yPoints addObject:[NSValue valueWithCGPoint:CGPointMake(cX, cY)]];
        }
        
    }
}

#pragma mark - 创建动画
-(void)createAnimation
{
    CATransition *transition = [[CATransition alloc] init];
//    transition.type = @"rippleEffect";
    transition.type = kCATransitionFade;
    transition.duration = 0.5;
    [self.layer addAnimation:transition forKey:nil];
}

@end

