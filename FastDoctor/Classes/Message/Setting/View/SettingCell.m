//
//  SettingCell.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell()

@end
@implementation SettingCell
static NSInteger _index;
+ (instancetype)settingCellWith:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    _index  = indexPath.row;
    
    if (cell == nil) {
        
        cell = [[SettingCell alloc] initWithStyle:1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (void)saveVersonWith:(NSString *)currentVersion
{
    //获取当前的版本号
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    //NSString *currentVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentVersion"];
    
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
     [userDefaults setObject:currentVersion forKey:@"currentVersion"];
    
    //同步
    [userDefaults synchronize];
}
#pragma 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        
        if (_index == 0) {
            
            self.textLabel.text = @"软件消息提醒";
            UISwitch *switcher = [[UISwitch alloc] init];
            self.accessoryView = switcher;
            
            //给switch注册一个值改变事件
            [switcher addTarget:self action:@selector(didValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            
            //赋值
            //拿到当前的偏好设置对象
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            switcher.on = [userDefaults boolForKey:@"switch_name"];
            
        } else if (_index == 1){
            self.textLabel.text = @"联系客服";
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (_index == 2){
            
            self.textLabel.text = @"检查更新";
            //获取版本信息
            NSString *currentVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentVersion"];
            if (currentVersion.length == 0) {
                
                //获取当前的版本号
                currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
            }
            NSString *msg = [NSString stringWithFormat:@"最新版本为:%@.0",currentVersion];
            
            self.detailTextLabel.text = msg;
            
            //存
            [self saveVersonWith: currentVersion];
            
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (_index == 3){
            
            self.textLabel.text = @"用户协议";
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }


    }
    return self;
}

- (void)didValueChanged:(UISwitch *)sender
{
    //拿到当前的偏好设置对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //利用偏好设置归档
    [userDefaults setBool:sender.isOn forKey:@"switch_name"];
    
    //同步
    [userDefaults synchronize];
    

}

@end
