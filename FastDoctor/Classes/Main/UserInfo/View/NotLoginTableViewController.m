//
//  NotLoginTableViewController.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/26.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "NotLoginTableViewController.h"
#import "NotLogonTableViewCell.h"

@interface NotLoginTableViewController ()

@end

@implementation NotLoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDNotLogonHeader = @"UserCellNotLogonHeader";
    static NSString *IDNotLogonCell = @"UserNotLogonCell";
    NotLogonTableViewCell *notLogonCell;
    
    if (indexPath.row == 0) {
        notLogonCell.tag = 0;
        notLogonCell = [NotLogonTableViewCell initializeUserUnLogonInforCell:tableView reuseID:IDNotLogonHeader];
        return notLogonCell;
    }
    notLogonCell = [NotLogonTableViewCell initializeUserUnLogonInforCell:tableView reuseID:IDNotLogonCell];
    
    switch (indexPath.row) {
        case 1:
            notLogonCell.textLabel.text = @"设置与帮助";
            break;
        case 2:
            notLogonCell.textLabel.text = @"意见反馈";
            break;
        case 3:
            notLogonCell.tag = 3;
            break;
        default:
            break;
    }
    
    return notLogonCell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 用户信息
        return 120;
    }else if (indexPath.row == 1 || indexPath.row == 2){
        // 普通cell
        return 50;
    }else{
        // 最下面占位cell
        return 1000;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:// 点击了用户详情界面
            NSLog(@"点击了用户详情界面");
            break;
        case 1:
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SettingNotification" object:nil];
            break;
        case 2:
            NSLog(@"点击了意见反馈按钮");
            break;
            
        default:
            break;
    }
}

@end
