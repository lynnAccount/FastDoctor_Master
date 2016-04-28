//
//  DiseaseController.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "DiseaseController.h"
#import "OfficeLeftViewCell.h"
#import "OfficeRightViewCell.h"
#import "DepartmentHeaderView.h"
#import "HospitalController.h"
#import "DepartmentTool.h"
#import "DiseaseData.h"
#import "DepartmentNetData.h"


@interface DiseaseController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) DepartmentHeaderView *headerView;
@property (weak, nonatomic)  UITableView *leftView;
@property (weak, nonatomic)  UITableView *rightView;

@property (strong, nonatomic) NSMutableArray *rightmodel;


@end
@implementation DiseaseController

- (NSMutableArray *)rightmodel
{
    if (_rightmodel == nil) {
        _rightmodel = [NSMutableArray array];
    }
    return _rightmodel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpHeader];
    
    
    
    
    //创建两个tableView
    [self setUpTableViews];
    
    self.leftView.rowHeight = 85;
    self.rightView.rowHeight = 45;
    
    self.leftView.showsVerticalScrollIndicator = NO;
    self.rightView.showsVerticalScrollIndicator = NO;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.leftView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
    
}

#pragma  mark - 拿到数据
- (void)setData:(NSArray *)data
{
    _data = data;
    
    
    
    DiseaseData *model = self.data[0];

   [self loadDataWith:model.cid_id];

    
}


//发送网络请求
- (void)loadDataWith:(int)cid_id
{
    [DepartmentTool newDepartmentWithSinceId:cid_id page:1 Success:^(NSArray *data) {
        
        [self.rightmodel removeAllObjects];
        [self.rightmodel addObjectsFromArray:data];
        [self.rightView reloadData];
    } Failure:^(NSError *error) {
        NSLog(@"加载数据失败 %@",error);
    }];
}
//创建header
- (void)setUpHeader
{
    
    DepartmentHeaderView *headerView = [[DepartmentHeaderView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    self.headerView = headerView;
}

- (void)setUpTableViews
{
    UITableView *leftView = [[UITableView alloc] init];
    leftView.dataSource = self;
    leftView.delegate = self;
    [self.view addSubview:leftView];
    self.leftView = leftView;
    
    
    UITableView *rightView = [[UITableView alloc] init];
    rightView.dataSource = self;
    rightView.delegate = self;
    [self.view addSubview:rightView];
    self.rightView = rightView;
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat headerViewX = 0;
    CGFloat headerViewY = 64;
    CGFloat headerViewW = [UIScreen mainScreen].bounds.size.width ;
    CGFloat headerViewH = 0;
    NSString *title = self.title;
    self.headerView.alpha = 0;
    
    if (title.length != 0 && [self.title isEqualToString:@"选择科室"])
    {
        self.headerView.alpha = 1;
        headerViewH = 80;
    }
    
    self.headerView.frame = CGRectMake(headerViewX, headerViewY, headerViewW, headerViewH);
    
    CGFloat maxheaderViewY = CGRectGetMaxY(self.headerView.frame);
    
    CGFloat leftViewX = 0;
    CGFloat leftViewY = maxheaderViewY ;
    CGFloat leftViewW = [UIScreen mainScreen].bounds.size.width * 0.3;
    CGFloat leftViewH = [UIScreen mainScreen].bounds.size.height;
    
    self.leftView.frame = CGRectMake(leftViewX, leftViewY, leftViewW, leftViewH);
    
    CGFloat rightViewX = leftViewW;
    CGFloat rightViewY =  maxheaderViewY;
    CGFloat rightViewW = [UIScreen mainScreen].bounds.size.width - leftViewW;
    CGFloat rightViewH = leftViewH;
    
    self.rightView.frame = CGRectMake(rightViewX, rightViewY, rightViewW, rightViewH);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
        if (tableView == self.leftView) {
            
            
          
            return self.data.count;


        }else {
            
            
            return self.rightmodel.count;
        }
        
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    if (tableView == self.leftView) {
        
        OfficeLeftViewCell *leftcell = [OfficeLeftViewCell officeLeftViewCellWith:tableView];
        cell = leftcell;
        
        
            DiseaseData *dis = self.data[indexPath.row];
            cell.textLabel.text = dis.diseaseName;
            
               
        
    } else {
        
        OfficeRightViewCell *rightcell = [OfficeRightViewCell officeRightViewCellWith:tableView];
        cell = rightcell;
        
        if (self.rightmodel.count != 0)
        {
            
            DepartmentNetData *rightData = self.rightmodel[indexPath.row];
            
            rightcell.textLabel.text = rightData.ci3_name;
            
        }
        
        
    }
    return cell;
    
    
}

//选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //如果是左边的
    if (tableView == self.leftView) {

        DiseaseData *data = self.data[indexPath.row];
        //加载数据
        [self loadDataWith:data.cid_id];
        
    } else {//右边
        
        UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        HospitalController *vc = [[HospitalController alloc] init];
        vc.placehoder = @"请输入医院名称查找";
        vc.cellText = cell.textLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}


@end
