//
//  RegisterDetailController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "RegisterDetailController.h"
#import "RegisterDetailCell.h"
#import "RegisterSureController.h"
@interface RegisterDetailController()


@end
@implementation RegisterDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
            
            
            RegisterSureController *vc = [[RegisterSureController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
