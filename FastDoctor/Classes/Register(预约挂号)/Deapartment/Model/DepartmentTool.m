//
//  DepartmentTool.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "DepartmentTool.h"
#import "NetworkTool.h"
#import "DepartmentNetData.h"
#import "MJExtension.h"

@implementation DepartmentTool

+ (void)newDepartmentWithSinceId:(int)Id page:(int)page   Success:(SuccessBlock)successBlock Failure:(FailureBlock)failureBlock;
{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"page"] = @(page);
    para[@"page_size"] = @(15);
    para[@"ci1_id"] = @(Id);
    para[@"keyword"] = @"";
    
    
    [[NetworkTool sharedManager] post:@"searchCI3List.json.php" parameters:para success:^(id result) {
        

        NSArray *data = result[@"data"];
        
        NSArray *marray = [DepartmentNetData mj_objectArrayWithKeyValuesArray:data];

        if (successBlock)
        {
            successBlock(marray);
        }
    } failure:^(NSError *error) {
        
    
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
    

}
+ (void)moreDepartmentWithMaxId:(int)Id page:(int)page  Success:(SuccessBlock)successBlock Failure:(FailureBlock)failureBlock;
{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"page"] = @(page);
    para[@"page_size"] = @(15);
    para[@"ci1_id"] = @(Id);
    para[@"keyword"] = @"";
    para[@"login_token"] = @"985c96ce43bb5ef69de3e1ad8afaa83f";
    
    [[NetworkTool sharedManager] post:@"searchCI3List.json.php" parameters:para success:^(id result) {
        
        NSArray *data = result[@"data"];
        
        NSArray *marray = [DepartmentNetData mj_objectArrayWithKeyValuesArray:data];
        

        if (successBlock)
        {
            successBlock(marray);
        }
    } failure:^(NSError *error) {
        
        
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];
}

@end
