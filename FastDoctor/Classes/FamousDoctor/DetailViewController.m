//
//  DetailViewController.m
//  FastDoctor
//
//  Created by Macdav on 16/4/22.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "DetailViewController.h"
#import "DiseaseDetailViewController.h"
#import "NetworkTool.h"
#import "DiseaseDetail.h"
#import "MJExtension.h"
@interface DetailViewController ()
@property (nonatomic, strong)NSArray *diseaseList;

//接收cell点击的数据
@property (nonatomic, copy)NSString *cellData;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    [self setupDiseaseDetail];
    
}
- (void)setupDiseaseDetail{
    
    NSDictionary *parameters = @{@"page":@1,@"page_size":@15,@"ci1_id":@1,@"keyword":@""};
    [[NetworkTool sharedManager] post:@"http://iosapi.itcast.cn/doctor/searchCI3List.json.php" parameters:parameters success:^(NSDictionary *result) {
        
        NSArray *date = result[@"data"];
        
        NSArray *arrayM = [DiseaseDetail mj_objectArrayWithKeyValuesArray:date];
        self.diseaseList = arrayM;
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.diseaseList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *allDiseasesID = @"alldiseasesID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:allDiseasesID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:allDiseasesID];
    }
    
    //获取模型数据
    DiseaseDetail *model = self.diseaseList[indexPath.row];
    cell.textLabel.text = model.ci3_name;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//发送通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //获取模型数据
    DiseaseDetail *model = self.diseaseList[indexPath.row];
    
    NSMutableDictionary *userinfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:model.ci3_name,@"disease", nil];
    
//    NSLog(@"%@",self.diseaseList[indexPath.row]);
    
    [center postNotificationName:@"DiseaseDetailCellDidClick" object:self userInfo:userinfo];
    //返回上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
