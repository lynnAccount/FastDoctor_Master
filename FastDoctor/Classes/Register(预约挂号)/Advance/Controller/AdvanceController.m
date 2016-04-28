//
//  AdvanceController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "AdvanceController.h"
#import "AdvanceCell.h"



@interface AdvanceController ()


@end
@implementation AdvanceController


static NSInteger _advanceCount;
+ (void)initialize
{
    _advanceCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"AdvanceCount"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 90;
    
    
    self.title = @"预约挂号列表";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.view.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    
    
      [self showNoData];
    
    
    
}
- (void)showNoData
{
    UILabel *lable = [[UILabel alloc] init];
    
    lable.frame = CGRectMake(30, 60, [UIScreen mainScreen].bounds.size.width - 60, 50);
    lable.text = @"您还没有预约列表,赶紧去添加吧";
    lable.font = [UIFont systemFontOfSize:17];
    lable.textColor = [UIColor blackColor];
    lable.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lable];
    
    if (_advanceCount != 0) {
        
        lable.hidden = YES;
    } else {
        lable.hidden = NO;

    }
    
    
}

- (void)addAdvanceCount
{
    _advanceCount ++;
    [self SaveAdvanceInfo];

    [self.tableView reloadData];
}


- (void)SaveAdvanceInfo
{
    NSUserDefaults *usrDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    [usrDefaults setInteger:_advanceCount forKey:@"AdvanceCount"];
    
    [usrDefaults synchronize];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _advanceCount ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AdvanceCell *cell = [AdvanceCell advanceCellWith:tableView];
    cell.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
@end
