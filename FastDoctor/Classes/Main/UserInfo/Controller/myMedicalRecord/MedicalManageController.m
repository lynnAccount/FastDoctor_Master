//
//  MedicalManageController.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "MedicalManageController.h"
#import "MedicalHeaderView.h"

@interface MedicalManageController ()

@end

@implementation MedicalManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MedicalHeaderView *headerView = [[MedicalHeaderView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 180)];
    [self.view addSubview:headerView];
    self.title = @"病历管理";
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
