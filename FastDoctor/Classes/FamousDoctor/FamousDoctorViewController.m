//
//  FamousDoctorViewController.m
//  FastDoctor
//
//  Created by Macdav on 16/4/26.
//  Copyright © 2016年 01Group. All rights reserved.
//
#define MAS_SHORTHAND

// 只要添加了这个宏，equalTo就等价于mas_equalTo

#define MAS_SHORTHAND_GLOBALS
#import "FamousDoctorViewController.h"
#import "Masonry.h"
@interface FamousDoctorViewController ()

@end

@implementation FamousDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupFamousDoctor];
}
- (void)setupFamousDoctor{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"famous"]];
    [self.view addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(80);
        make.left.equalTo(self.view.left).offset(10);
        make.right.equalTo(self.view.right).offset(-10);
        make.height.equalTo(362);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
