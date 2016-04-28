//
//  LoginTableViewController.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/26.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "LoginTableViewController.h"
#import "UserInfoTableViewCell.h"

@interface LoginTableViewController ()

@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 已经登录
    static NSString *IDHeader = @"UserCellHeader";
    static NSString *IDCell = @"UserCell";
    
    UserInfoTableViewCell *cell;
    if (indexPath.row == 0) {
        
        cell.tag = 0;
        cell = [UserInfoTableViewCell initializeUserInforCell:tableView reuseID:IDHeader];
    }else if(indexPath.row == 6){
        
        cell.tag = 6;
        cell = [UserInfoTableViewCell initializeUserInforCell:tableView reuseID:IDCell];
    }else{
        cell.tag = 9;
        cell = [UserInfoTableViewCell initializeUserInforCell:tableView reuseID:IDCell];
        
        switch (indexPath.row) {
            case 1:
                cell.textLabel.text = @"预约挂号列表";
                cell.tag = 1;
                break;
            case 2:
                cell.textLabel.text = @"名医通申请";
                cell.tag = 2;
                
                break;
            case 3:
                cell.textLabel.text = @"病例管理";
                cell.tag = 3;
                
                break;
            case 4:
                cell.textLabel.text = @"我的收藏";
                cell.tag = 4;
                
                break;
            case 5:
                cell.tag = 5;
                
                cell.textLabel.text = @"支付明细";
                break;
            case 7:
                cell.tag = 7;
                
                cell.textLabel.text = @"设置与帮助";
                break;
            case 8:
                cell.tag = 8;
                
                cell.textLabel.text = @"意见反馈";
                break;
            default:
                break;
        }
    }
    return cell;
}


#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 登录
    
    if (indexPath.row == 0) {
        // 登录cell
        return 90;
    }else if(indexPath.row == 6){
        // 中间分割cell
        return 70;
    }else if(indexPath.row == 9){
        // 最下面顶出cell
        return 300;
    }else{
        // 普通cell
        return 50;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 表示已经登录
    switch (indexPath.row) {
        case 0:
            NSLog(@"点击了用户资料");
            break;
        case 1:{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AdvanceNotification" object:nil];
        }
            break;
        case 2:
            [[NSNotificationCenter defaultCenter] postNotificationName:@"FamousDoctorNotification" object:nil];
            break;
        case 3:{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"MyMedicalRecordNotification" object:nil];
        }
            break;
        case 4:
            NSLog(@"我的收藏");
            break;
        case 5:
            NSLog(@"支付明细");
            break;
        case 7:{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SettingNotification" object:nil];
        }
            break;
        case 8:
            NSLog(@"意见反馈");
            break;
            
        default:
            break;
    }
}


@end
