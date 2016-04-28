//
//  NetworkTool.h
//  FastDoctor
//
//  Created by lynn on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface NetworkTool : AFHTTPSessionManager

/// 单例方法
+ (instancetype)sharedManager;

/// post请求方法
///
/// @param urlString  url字符串
/// @param parameters 参数: 字典
/// @param success    成功回调
/// @param failure    失败回调
- (void)post:(NSString *)urlString parameters:(id)parameters success:(void(^)(id result))success failure:(void(^)(NSError *error))failure;

@end
