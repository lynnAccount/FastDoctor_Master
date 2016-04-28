//
//  UIView+QLFrame.m
//  新浪微博
//
//  Created by 周泉龙 on 16/3/26.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "UIView+QLFrame.h"

@implementation UIView (QLFrame)
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame  = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame  = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

@end
