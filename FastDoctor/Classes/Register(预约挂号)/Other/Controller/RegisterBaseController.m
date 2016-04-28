//
//  RegisterBaseController.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "RegisterBaseController.h"
#import "OfficeSearchBar.h"
#import "AdvanceController.h"

@interface RegisterBaseController ()<UITextFieldDelegate>

@end

@implementation RegisterBaseController

- (void)setPlacehoder:(NSString *)placehoder
{
    _placehoder = placehoder;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置nav
    [self setUpNav];
    
}


- (void)setUpNav
{
    if (self.placehoder.length == 0) {
        
        //[self setUpHeader];
        return;
        
    } else {
        
        UIView *view = [[UIView alloc] init];
        
        view.frame = CGRectMake(0, 0, 200, 35);
        
        OfficeSearchBar *searchBar = [[OfficeSearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
        
        
        searchBar.placeholder = self.placehoder;
        searchBar.delegate = self;
        [view addSubview:searchBar];
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(160, 0, 40, 35);
        [view addSubview:btn];
        
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
        
        
        self.navigationItem.titleView = view;
    }
    
}
////创建header
//- (void)setUpHeader
//{
//
//}
//点击事件
- (void)click
{
        
    NSLog(@"点击了search");
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
