//
//  DiseaseData.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "DiseaseData.h"

@implementation DiseaseData

+ (instancetype)diseaseDataWithDic:(NSDictionary *)dic
{
    id m = [[self alloc] init];
    [m setValuesForKeysWithDictionary:dic];
    return m;
    
}
+ (NSArray *)diseaseData
{
    
    NSArray *m = @[@{@"diseaseName":@"肿瘤", @"cid_id":@1}, @{@"diseaseName":@"心血管", @"cid_id":@3}];
    
    NSMutableArray *marray = [NSMutableArray array];

    for (NSDictionary *dic in m) {
        
        DiseaseData *d = [DiseaseData diseaseDataWithDic:dic];
        
        [marray addObject:d];
    }
    return marray.copy;

}

@end
