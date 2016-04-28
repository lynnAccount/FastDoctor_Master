//
//  UITextField+Extension.m
//  test
//
//  Created by 周泉龙 on 16/4/21.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

+(void)imageName:(NSString *)imageName textFiled:(UITextField *)textFiled
{
    UIImageView *nameView = [[UIImageView alloc] init];
    nameView.frame = CGRectMake(0, 0, 30, 30);
    nameView.image = [UIImage imageNamed:imageName];
    nameView.contentMode = UIViewContentModeCenter;
    textFiled.leftView = nameView;
    textFiled.leftViewMode = UITextFieldViewModeAlways;
}

@end
