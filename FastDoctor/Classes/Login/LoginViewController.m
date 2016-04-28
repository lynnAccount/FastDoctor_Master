//
//  LoginViewController.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "LoginViewController.h"
#import "UITextField+Extension.h"
#import "RegisterViewController.h"
#import "BaseNavigationCtl.h"
#import "UserInfoViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *cardID;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *rightNumber;
@property (weak, nonatomic) IBOutlet UITextField *pointOutTextFiled;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpUI];
    
}

// UI界面设置
-(void)setUpUI
{
    self.title = @"用户登录";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"快速注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerQuickly)];
    
    // 设置textFiled
    [UITextField imageName:@"icon_logon" textFiled:self.name];
    [UITextField imageName:@"id" textFiled:self.cardID];
    [UITextField imageName:@"mobile" textFiled:self.phoneNumber];
    [UITextField imageName:@"clip" textFiled:self.rightNumber];
    [UITextField imageName:@"注意" textFiled:self.pointOutTextFiled];
    
}

// 弹出控制器
-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 点击了注册按钮
-(void)registerQuickly
{
    RegisterViewController *registerCtl = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerCtl animated:YES];
}

// 点击了获取验证码按钮
- (IBAction)didClickGetRightNumber:(UIButton *)sender {
    NSLog(@"点击了获取验证码按钮");
}

// 点击了登录按钮
- (IBAction)didClickLoginButton:(UIButton *)sender {
    
    //弹出警告框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户操作提示" message:@"您已登录成功" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
            [self.navigationController popViewControllerAnimated:YES];
    }]];

    // 弹出控制器
    [self presentViewController:alert animated:YES completion:nil];
    
    NSString *name = self.name.text;
    NSString *password = self.rightNumber.text;
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    [userdefault setObject:name forKey:@"name"];
    [userdefault setObject:password forKey:@"rightNumber"];
    [userdefault synchronize];

    
}




@end
