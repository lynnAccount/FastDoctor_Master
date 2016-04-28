//
//  SelectedMoreViewController.m
//  FastDoctor
//
//  Created by Macdav on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "SelectedMoreViewController.h"
#import "NetworkTool.h"
#import "MJExtension.h"
#import "SelectedMore.h"

@interface SelectedMoreViewController ()
@property (nonatomic, strong)NSArray *selectedMoreArray;

@end

@implementation SelectedMoreViewController
- (NSArray *)selectedMoreArray {
    if (_selectedMoreArray == nil) {
        _selectedMoreArray = [NSArray array];
    }
    return _selectedMoreArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self getNetWorkData];
}
//获取网络数据
- (void)getNetWorkData{
    
    NSDictionary *parameters = @{@"page":@1,@"page_size":@15,@"ci2_id":@3};
    
    [[NetworkTool sharedManager] post:@"http://iosapi.itcast.cn/doctor/complicationList.json.php" parameters:parameters success:^(NSDictionary *result) {
        
        NSArray *data = result[@"data"];
        
        NSArray *arrayM = [SelectedMore mj_objectArrayWithKeyValuesArray:data];
        
        self.selectedMoreArray = arrayM;
        //赋值完一定要刷新
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selectedMoreArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *selectedMoreID = @"selectedMoreID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectedMoreID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectedMoreID];
    }
    //获取模型数据
    SelectedMore *model = self.selectedMoreArray[indexPath.row];
    
    cell.textLabel.text = model.complication_name;
    
    return cell;
}
//选中某行的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    SelectedMore *model = self.selectedMoreArray[indexPath.row];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:model.complication_name,@"selectedMoreMsg", nil];
    
    [center postNotificationName:@"SelectedMoreCell" object:self userInfo:userInfo];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
