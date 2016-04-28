//
//  RegisterSuccessController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "RegisterSuccessController.h"
#import "MainViewController.h"
@interface RegisterSuccessController ()

@property (nonatomic, weak) UIButton *btn1;
@property (nonatomic, weak) UIButton *btn2;
@property (nonatomic, weak) UIImageView *headerView;
@property (nonatomic, weak) UIScrollView *scrollView;


@end
@implementation RegisterSuccessController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"已提交审核";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpbody];
    
    

}

- (void)setUpbody
{
    
    //创建一个scrollView
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    

    UIImageView *headerView = [[UIImageView alloc] init];
    
    [scrollView addSubview:headerView];
    self.headerView = headerView;
    headerView.image = [UIImage imageNamed:@"success"];
    
    
    
    UIButton *btn1 = [[UIButton alloc] init];
    [scrollView addSubview:btn1];
    self.btn1 = btn1;
    [btn1 setTitle:@"返回首页" forState:UIControlStateNormal];
    btn1.layer.cornerRadius = 10;
    btn1.clipsToBounds = YES;
    [btn1 setBackgroundColor:[UIColor colorWithRed:0/255.0 green:197/255.0 blue:197/255.0 alpha:1.0]];
    [btn1 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] init];
    [scrollView addSubview:btn2];
    self.btn2 = btn2;
    [btn2 setTitle:@"个人中心" forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 10;
    btn2.clipsToBounds = YES;
    [btn2 setBackgroundColor:[UIColor colorWithRed:0/255.0 green:197/255.0 blue:197/255.0 alpha:1.0]];
    [btn2 addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    
}


//点击了确认
- (void)btn:(UIButton *)sender
{

    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat w = self.view.bounds.size.width;
    
    self.headerView.frame = CGRectMake(0, 0, w, 366);
    
    CGFloat maxHeaderY = CGRectGetMaxY(self.headerView.frame);
    self.btn1.frame = CGRectMake(10, maxHeaderY + 30, w * 0.5 - 20, 40);
    
    CGFloat maxBtn1X = CGRectGetMaxX(self.btn1.frame);

    self.btn2.frame = CGRectMake(maxBtn1X + 15, maxHeaderY + 30, w * 0.5 - 20, 40);
    
    CGFloat maxBtnY = CGRectGetMaxY(self.btn1.frame);

    self.scrollView.contentSize = CGSizeMake(w, maxBtnY);

    
}

@end
