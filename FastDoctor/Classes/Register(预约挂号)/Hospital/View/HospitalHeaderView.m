//
//  HospitalHeaderView.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "HospitalHeaderView.h"

@interface HospitalHeaderView ()

@property (nonatomic, weak) UIButton *btn1;

@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIView *centerLine;
@property (nonatomic, weak) UIView *buttomLine;

@end
@implementation HospitalHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addAllSupviews];
    }
    return self;
}

- (void)addAllSupviews
{
    
    
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setTitle:@"医院等级" forState:UIControlStateNormal];
    [self addSubview:btn1];
    self.btn1 = btn1;
    [btn1 setTitleColor:[UIColor colorWithRed:157/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"医院地区" forState:UIControlStateNormal];
    [self addSubview:btn2];
    self.btn2 = btn2;
    
    [btn2 setTitleColor:[UIColor colorWithRed:157/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *centerLine = [[UIView alloc] init];
    [self addSubview:centerLine];
    self.centerLine = centerLine;
    centerLine.backgroundColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0];
    
    
    UIView *buttomLine = [[UIView alloc] init];
    [self addSubview:buttomLine];
    self.buttomLine = buttomLine;
    
    buttomLine.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    
}

- (void)btn1Click
{
    NSLog(@"点击了医院等级");
}

- (void)btn2Click
{
    NSLog(@"点击了医院地区");
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //btn1
    CGFloat btn1X = 0;
    CGFloat btn1Y = 0;
    CGFloat btn1W = self.bounds.size.width * 0.5 - 0.5;
    CGFloat btn1H = self.bounds.size.height;
    
    self.btn1.frame = CGRectMake(btn1X, btn1Y, btn1W, btn1H);
    
    //centerline
    CGFloat clX = btn1W;
    CGFloat clY = btn1H * 0.1;
    CGFloat clW = 1;
    CGFloat clH = btn1H - clY * 2;
    
    self.centerLine.frame = CGRectMake(clX, clY, clW, clH);
    
    //btn2
    CGFloat btn2X = btn1W + 1;
    CGFloat btn2Y = 0;
    CGFloat btn2W = btn1W;
    CGFloat btn2H = btn1H;
    
    self.btn2.frame = CGRectMake(btn2X, btn2Y, btn2W, btn2H);
    
    
    CGFloat blX = 0;
    CGFloat blY = btn1H - 1;
    CGFloat blW = self.bounds.size.width;
    CGFloat blH = 1;
    
    self.buttomLine.frame = CGRectMake(blX, blY, blW, blH);
}
@end
