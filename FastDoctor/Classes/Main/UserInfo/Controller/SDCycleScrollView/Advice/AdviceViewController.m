//
//  AdviceViewController.m
//  FastDoctor
//
//  Created by lynn on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "AdviceViewController.h"

@interface AdviceViewController ()

@property (nonatomic, strong) UITextView *adviceView;

@end

@implementation AdviceViewController

- (UITextView *)adviceView{
    if (_adviceView == nil) {
        _adviceView = [[UITextView alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.width - 40, 300, 250)];
        
        _adviceView.text = @"请填写您遇到的问题";
        
        
        // 仿占位文字
        
        // 你还可以输入...
    }
    return _adviceView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_adviceView];
    
    self.title = @"意见反馈";
}


@end
