//
//  RegisterSureController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "RegisterSureController.h"
#import "RegisterSuccessController.h"


@interface RegisterSureController ()

@property (nonatomic, weak) UIButton *btn;

@property (nonatomic, weak) UIImageView *headerView;

@property (nonatomic, weak) UIScrollView *scrollView;

@end
@implementation RegisterSureController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"挂号信息确认";
    
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
    headerView.image = [UIImage imageNamed:@"RegistSure_header"];
    
    
    
    UIButton *btn = [[UIButton alloc] init];
    [scrollView addSubview:btn];
    self.btn = btn;
    [btn setTitle:@"确认预约" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10;
    btn.clipsToBounds = YES;
    [btn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:197/255.0 blue:197/255.0 alpha:1.0]];
    [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    
}


//点击了确认
- (void)btn:(UIButton *)sender
{

    RegisterSuccessController *vc = [[RegisterSuccessController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    //发通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AdvanceCountNotification" object:nil];
    

    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat w = self.view.bounds.size.width;
    //CGFloat h = self.navigationController.navigationBar.bounds.size.height;
    
    
    
    self.headerView.frame = CGRectMake(0, 0, w, 523);
    
    CGFloat maxHeaderY = CGRectGetMaxY(self.headerView.frame);
    self.btn.frame = CGRectMake(10, maxHeaderY + 20, w * 0.9, 40);
    CGFloat maxBtnY = CGRectGetMaxY(self.btn.frame);

    self.scrollView.contentSize = CGSizeMake(w, maxBtnY);

    
}

@end
