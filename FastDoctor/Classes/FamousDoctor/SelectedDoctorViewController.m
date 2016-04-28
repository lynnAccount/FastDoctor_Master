//
//  SelectedDoctorViewController.m
//  FastDoctor
//
//  Created by Macdav on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "SelectedDoctorViewController.h"
#import "NetworkTool.h"
#import "MJExtension.h"
#import "SelectedDoctorViewCell.h"

@interface SelectedDoctorViewController ()
@end

@implementation SelectedDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
    [self getNetWorkData];
    
}
//获取网络数据
- (void)getNetWorkData{
    NSDictionary *parameters = @{@"ci1_id":@1,@"ci2_id":@3,@"ci3_id":@3,@"diagnosis_type":@0,@"is_confirmed":@1,@"user_id":@1000089, @"has_diagnosis":@2};
    
    [[NetworkTool sharedManager] post:@"http://iosapi.itcast.cn/doctor/matchedDoctorCount.json.php" parameters:parameters success:^(NSDictionary *result) {

    
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *selectedDoctorID = @"selectedDoctorID";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectedDoctorID ];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectedDoctorID];
//    }
    SelectedDoctorViewCell *cell = [SelectedDoctorViewCell selectedDoctorCellWithTableView:tableView];
    //获取数据赋值
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
