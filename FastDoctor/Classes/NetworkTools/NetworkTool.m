//
//  NetworkTool.m
//  FastDoctor
//
//  Created by lynn on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//


#import "NetworkTool.h"

@implementation NetworkTool
+ (instancetype)sharedManager{
    static NetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://iosapi.itcast.cn/doctor/"];
        instance = [[NetworkTool alloc] initWithBaseURL:baseURL];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    
    return instance;
}

- (void)post:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    [self POST:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end
