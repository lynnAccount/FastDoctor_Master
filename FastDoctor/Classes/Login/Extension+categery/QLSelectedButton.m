//
//  QLSelectedButton.m
//  test
//
//  Created by 周泉龙 on 16/4/21.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "QLSelectedButton.h"
#import "UIView+QLFrame.h"

@implementation QLSelectedButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1]];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.titleLabel sizeToFit];
    }
    
    return self;
}
//
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.titleLabel sizeToFit];
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}
-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}

@end
