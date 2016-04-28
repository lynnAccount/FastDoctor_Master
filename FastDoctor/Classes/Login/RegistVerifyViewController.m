//
//  RegistVerifyViewController.m
//  test
//
//  Created by 周泉龙 on 16/4/22.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "RegistVerifyViewController.h"

@interface RegistVerifyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDTypeLabel;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *localNowLabel;


@end

@implementation RegistVerifyViewController

// 点击了确认注册按钮
- (IBAction)didClickCompiteRegist:(UIButton *)sender {
    NSLog(@"确认注册");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"确认注册信息";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"22"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
