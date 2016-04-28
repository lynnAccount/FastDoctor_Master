//
//  OfficeSearchBar.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "OfficeSearchBar.h"

@implementation OfficeSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        
        
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, 5, 30);
        [self addSubview:view];
        
        
        self.leftView = view;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightView = imageview;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        self.borderStyle = UITextBorderStyleRoundedRect;
        
    }
    return self;
}

@end
