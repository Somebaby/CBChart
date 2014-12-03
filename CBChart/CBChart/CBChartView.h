//
//  CBChartView.h
//  CBChart
//
//  Created by pacific on 14/12/1.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBChartView : UIView

+(instancetype)charView;

/*
 * x坐标的值和y坐标的值
 * coordinate values, chart will generate label by itself
 * try to value string to xValues' element or yValues' element
 */
@property (strong, nonatomic) NSArray *xValues;
@property (strong, nonatomic) NSArray *yValues;

@end

