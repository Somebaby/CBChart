//
//  CBBgLayer.h
//  CBChart
//
//  Created by pacific on 14/12/4.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CBBgLayer : CALayer


@property (strong, nonatomic) NSMutableArray *xPoints;
@property (strong, nonatomic) NSMutableArray *yPoints;

@property (strong, nonatomic) NSArray *xValues;
@property (strong, nonatomic) NSArray *yValues;

@end
