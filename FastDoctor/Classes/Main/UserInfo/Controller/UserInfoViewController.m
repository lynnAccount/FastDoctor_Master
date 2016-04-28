//
//  UserInfoViewController.m
//  FastDoctor
//
//  Created by Captain-Lee on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//


#import "UserInfoViewController.h"
#import "InfoButton.h"
#import "UserInfoTableViewCell.h"
#import "MedicalManageController.h"
#import "AdvanceController.h"
#import "NotLogonTableViewCell.h"
#import "AdviceViewController.h"
#import "LoginTableViewController.h"
#import "NotLoginTableViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.isLogin = NO;
//    // 登录
//    if (self.isLogin == YES) {
//        LoginTableViewController *loginViewCtl = [[LoginTableViewController alloc] init];
//        loginViewCtl.view.backgroundColor = [UIColor whiteColor];
//        [self addChildViewController:loginViewCtl];
//        [self.view addSubview:loginViewCtl.view];
//        loginViewCtl.view.frame = self.view.bounds;
//    } else {// 未登录
//        NotLoginTableViewController *notLoginCtl = [[NotLoginTableViewController alloc] init];
//        notLoginCtl.view.backgroundColor = [UIColor whiteColor];
//        [self addChildViewController:notLoginCtl];
//        [self.view addSubview:notLoginCtl.view];
//        notLoginCtl.view.frame = self.view.bounds;
//    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"name"];
    NSString *password = [userDefault objectForKey:@"rightNumber"];

    
    // 登录
    if ([name isEqualToString:@"abc"] && [password isEqualToString:@"123456"]) {
        
        LoginTableViewController *loginViewCtl = [[LoginTableViewController alloc] init];
        loginViewCtl.view.backgroundColor = [UIColor whiteColor];
        [self addChildViewController:loginViewCtl];
        [self.view addSubview:loginViewCtl.view];
        loginViewCtl.view.frame = self.view.bounds;
        
    } else {// 未登录
        
        NotLoginTableViewController *notLoginCtl = [[NotLoginTableViewController alloc] init];
        notLoginCtl.view.backgroundColor = [UIColor whiteColor];
        [self addChildViewController:notLoginCtl];
        [self.view addSubview:notLoginCtl.view];
        notLoginCtl.view.frame = self.view.bounds;
    }
}


@end
