//
//  BaseNavigationCtl.m
//  test
//
//  Created by 周泉龙 on 16/4/21.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "BaseNavigationCtl.h"
#import "LoginViewController.h"

@implementation BaseNavigationCtl

-(void)viewDidLoad
{
    [super viewDidLoad];

}

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    bar.barTintColor = [UIColor colorWithRed:31/255.0 green:199/255.0 blue:197/255.0 alpha:1.0];
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = dict;
}




@end
