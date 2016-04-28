//
//  HospitalController.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "HospitalController.h"
#import "HospitalHeaderView.h"
#import "HospitalViewCell.h"
#import "DepartmentController.h"
#import "HospitalSmallHeader.h"
#import "RegisterDetailController.h"
#import "DepartmentData.h"

@interface HospitalController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) HospitalSmallHeader *smallHeader;

@property (nonatomic, weak) HospitalHeaderView *header;
@property (nonatomic, weak) UITableView *tableView;


@end

@implementation HospitalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpHeader];

    
    [self setUpTableView];
    
   
}




- (void)setUpTableView
{
    UITableView *tableview = [[UITableView alloc] init];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.rowHeight = 70;
    [self.view addSubview:tableview];
    self.tableView = tableview;
}
- (void)setUpHeader
{
    
    
    HospitalHeaderView *header = [[HospitalHeaderView alloc] init];
    //header.backgroundColor = [UIColor redColor];
    [self.view addSubview:header];
    self.header = header;

}
- (void)setupSmallHeader
{
    HospitalSmallHeader *smallheader = [[HospitalSmallHeader alloc] init];
    [self.view addSubview:smallheader];
    self.smallHeader = smallheader;
}
- (void)setCellText:(NSString *)cellText
{
    _cellText = cellText;
    
    if (![cellText isEqualToString:@""]) {
      
        [self setupSmallHeader];
        self.smallHeader.cellText = cellText;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HospitalViewCell *cell = [HospitalViewCell hospitalViewCellWith:tableView];
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc;
    if (self.smallHeader == nil)
    {
        DepartmentController *vc1 = [[DepartmentController alloc] init];
        vc1.title = @"选择科室";
        NSArray *data = [DepartmentData departmentData];
        vc1.data = data;
        vc = vc1;

        
        
    } else {
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Register" bundle:nil];
        RegisterDetailController *vc1 = story.instantiateInitialViewController;
        

        vc1.departmentName = @"北京协和医院";
        vc1.hospitalName = @"神经内科";
        vc1.navigationItem.title = @"神经内科";
        vc1.navigationItem.prompt = @"北京协和医院";
        
        vc = vc1;
        
    }
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat smallheaderH = 0;

    if (self.smallHeader != nil)
        
    {
        CGFloat smallheaderX = 0;
        CGFloat smallheaderY = 64;
        CGFloat smallheaderW = [UIScreen mainScreen].bounds.size.width;
        smallheaderH = 40;
        self.smallHeader.frame = CGRectMake(smallheaderX, smallheaderY, smallheaderW, smallheaderH);
    }

    
    CGFloat headerX = 0;
    CGFloat headerY = 64 + smallheaderH;
    CGFloat headerW = [UIScreen mainScreen].bounds.size.width;
    CGFloat headerH = 45;
    self.header.frame = CGRectMake(headerX, headerY, headerW, headerH);
    
    CGFloat maxheaderY = CGRectGetMaxY(self.header.frame);
    CGFloat tvX = 0;
    CGFloat tvY = maxheaderY;
    CGFloat tvW = [UIScreen mainScreen].bounds.size.width;
    CGFloat tvH = self.view.bounds.size.height - tvY;
    
    self.tableView.frame = CGRectMake(tvX, tvY, tvW, tvH);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
