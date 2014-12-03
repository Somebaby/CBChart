//
//  CBLineChart.m
//  CBChart
//
//  Created by pacific on 14/11/28.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "CBLineChart.h"
#define chartMargin 15

@implementation CBLineChart

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initWithFrame");
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initWithCoder");
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
}


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
}

// 绘制图表的背景
-(void)bgroudPaint
{
    
    
}


@end
