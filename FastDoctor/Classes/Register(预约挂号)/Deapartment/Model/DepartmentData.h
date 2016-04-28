//
//  DepartmentData.h
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DepartmentData : NSObject

@property (nonatomic, copy) NSString *diseaseName;
@property (nonatomic, assign) int cid_id;

+ (instancetype)departmentDataWithDic:(NSDictionary *)dic;
+ (NSArray *)departmentData;
@end
