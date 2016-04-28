//
//  NSString+Rect.h
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NSString (Rect)

// 对象方法, 用来计算当前字符串的大小(CGRect)
- (CGRect)rectOfStringWithMaxSize:(CGSize)maxSize andDict:(NSDictionary *)attrs;

// 类方法, 用来计算给定的字符串的大小(CGRect)
+ (CGRect)rectWithText:(NSString *)text maxSize:(CGSize)maxSize dict:(NSDictionary *)attrs;

@end
