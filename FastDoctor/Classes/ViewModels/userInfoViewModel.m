//
//  userInfoViewModel.m
//  FastDoctor
//
//  Created by lynn on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "userInfoViewModel.h"
#import "MJExtension.h"
#import "NetworkTool.h"
@implementation userInfoViewModel

+ (void)userInfo{
//    请求地址: http://iosapi.itcast.cn/doctor/carelinkQuickLogin.json.php
//    请求参数:{"login_token":"985c96ce43bb5ef69de3e1ad8afaa83f"}
    NSMutableDictionary *pamars = [NSMutableDictionary dictionaryWithCapacity:1];
    
    pamars[@"login_token"] = @"985c96ce43bb5ef69de3e1ad8afaa83f";
    
    [[NetworkTool sharedManager] post:@"carelinkQuickLogin.json.php" parameters:pamars success:^(id result) {
        
        NSLog(@"%@", result);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
