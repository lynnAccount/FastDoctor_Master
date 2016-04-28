//
//  NSString+Rect.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "NSString+Rect.h"

@implementation NSString (Rect)

- (CGRect)rectOfStringWithMaxSize:(CGSize)maxSize andDict:(NSDictionary *)attrs {
    
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    
    return rect;
}


+ (CGRect)rectWithText:(NSString *)text maxSize:(CGSize)maxSize dict:(NSDictionary *)attrs {
    
    return [text rectOfStringWithMaxSize:maxSize andDict:attrs];
}

@end
