//
//  DepartmentData.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "DepartmentData.h"

@implementation DepartmentData

+ (instancetype)departmentDataWithDic:(NSDictionary *)dic
{
    id m = [[self alloc] init];
    [m setValuesForKeysWithDictionary:dic];
    return m;
    
}
+ (NSArray *)departmentData
{
    
    NSArray *m = @[@{@"diseaseName":@"血液科", @"cid_id":@2}, @{@"diseaseName":@"神经科", @"cid_id":@4}, @{@"diseaseName":@"骨科", @"cid_id":@5}];
    
    
    NSMutableArray *marray = [NSMutableArray array];
    
    for (NSDictionary *dic in m) {
        
        DepartmentData *d = [DepartmentData departmentDataWithDic:dic];
        
        [marray addObject:d];
    }
    return marray.copy;
    
}

@end
