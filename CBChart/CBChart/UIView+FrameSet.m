//
//  UIView+FrameSet.m
//  CBChart
//
//  Created by pacific on 14/12/2.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "UIView+FrameSet.h"

@implementation UIView (FrameSet)

-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width
{
    CGRect myFrame = self.frame;
    myFrame.size.width = width;
    self.frame = myFrame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
    CGRect myFrame = self.frame;
    myFrame.size.height = height;
    self.frame = myFrame;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x
{
    CGRect myFrame = self.frame;
    myFrame.origin.x = x;
    self.frame = myFrame;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y
{
    CGRect myFrame = self.frame;
    myFrame.origin.y = y;
    self.frame = myFrame;
}
-(CGSize)size
{
    return self.frame.size;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint pointCenter = self.center;
    pointCenter.x = centerX;
    self.center = pointCenter;
}

-(CGFloat)centerY
{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint pointCenter = self.center;
    pointCenter.y = centerY;
    self.center = pointCenter;
}

-(CGPoint)point
{
    return self.frame.origin;
}

-(void)setPoint:(CGPoint)point
{
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}
@end
