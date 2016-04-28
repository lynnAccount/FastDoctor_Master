//
//  SettingController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "SettingController.h"
#import "SettingCell.h"

@interface SettingController()


@end
@implementation SettingController



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (NSString *)checkVerson
{
    //获取当前的版本号
    //NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastVersion"];
    
    // [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:WBVerson];
    

    return lastVersion;
}
//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SettingCell *cell = [SettingCell settingCellWith:tableView IndexPath:indexPath];
    

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2)
    {
        //获取当前的版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
        
        
        NSString *msg = [NSString stringWithFormat:@"最新版本为:%@.0",currentVersion];
        [self productUpdateWith:msg];
    } else if (indexPath.row == 1){
        
        [self takeCell];
    }
}

//检查版本更新
- (void)productUpdateWith:(NSString *)msg{
    
    //弹出警告框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"版本更新提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//客服电话
- (void)takeCell {
    //打电话
    NSURL *url = [NSURL URLWithString:@"tel://400"];
    
    [[UIApplication sharedApplication] openURL:url];
}

@end
