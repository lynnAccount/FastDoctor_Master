//
//  DepartmentTool.h
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSArray *data);
typedef void (^FailureBlock)(NSError *error);

@interface DepartmentTool : NSObject

+ (void)newDepartmentWithSinceId:(int)Id page:(int)page   Success:(SuccessBlock)successBlock Failure:(FailureBlock)failureBlock;
+ (void)moreDepartmentWithMaxId:(int)Id page:(int)page  Success:(SuccessBlock)successBlock Failure:(FailureBlock)failureBlock;
@end
