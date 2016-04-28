//
//  MainViewController.m
//  FastDoctor
//
//  Created by Captain-Lee on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "MainViewController.h"
#import "MMDrawerController.h"
#import "LoginViewController.h"
#import "BaseNavigationCtl.h"
#import "DiseaseDetailViewController.h"
#import "HospitalController.h"
#import "DepartmentController.h"
#import "SDCycleScrollView.h"
#import "NetworkTool.h"
#import "DepartmentData.h"
#import "DiseaseData.h"
#import "userInfoViewModel.h"
#import "DiseaseController.h"
#import "MedicalManageController.h"
#import "AdvanceController.h"
#import "MessageController.h"
#import "UserInfoViewController.h"
#import "SettingController.h"
#import "RegisterViewController.h"
#import "FamousDoctorViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// 右侧登录按钮
@property (nonatomic, strong)UIBarButtonItem *rightItem;

// 轮播图
@property (nonatomic, strong)SDCycleScrollView *cycleView;

@property (nonatomic, strong )AdvanceController *vc;
@end

@implementation MainViewController


- (AdvanceController *)vc
{
    if (_vc== nil) {
        AdvanceController *vc = [[AdvanceController alloc] init];
        _vc = vc;
    }
    return _vc;
}

- (IBAction)hospitalClick:(id)sender {
    HospitalController *vc = [[HospitalController alloc] init];
    vc.placehoder = @"请输入医院查找";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)departmentClick:(id)sender {
    
    DepartmentController *vc = [[DepartmentController alloc] init];
    NSArray *data = [DepartmentData departmentData];
    vc.data = data;
    vc.placehoder = @"请输入科室查找";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)diseaseClick:(id)sender {
    DiseaseController *vc = [[DiseaseController alloc] init];
    NSArray *data = [DiseaseData diseaseData];
    vc.data = data;
    vc.placehoder = @"请输入疾病查找";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)seriousDiseaseClick:(UIButton *)sender {
    UIViewController *diseaseDetailVC = [[DiseaseDetailViewController alloc] init];
    [self.navigationController pushViewController:diseaseDetailVC animated:YES];

}

- (UIBarButtonItem *)rightItem{
    if (_rightItem == nil) {
        _rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"更多1"] style:UIBarButtonItemStyleDone target:self action:@selector(moreInfo)];
    }
    return _rightItem;
}

- (void)moreInfo{
    
    UIViewController *vc ;
    UserInfoViewController *vc1 = [[UserInfoViewController alloc] init];
    vc1.view.backgroundColor =  [UIColor whiteColor];
    
   NSUserDefaults *userDefults = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefults objectForKey:@"name"];
    NSString *number = [userDefults objectForKey:@"rightNumber"];
    
    if ([name isEqualToString:@"abc"] && [number isEqualToString:@"123456"]) {
        
        //需要判断登录状态
        MessageController *vc2 = [[MessageController alloc] init];
        vc = vc2;
        
    } else {
        
        LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        vc = login;
    }
    
     [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"114快医";

    NSArray *imgArray = @[@"hospitol1", @"hospitol2", @"hospitol3"];
    
    self.cycleView = [SDCycleScrollView cycleScrollViewWithFrame:self.scrollView.frame imageNamesGroup:imgArray];
    
    [self.view addSubview:self.cycleView];
    
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton addTarget:self action:@selector(userInfo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemleft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"心血管系统1"] style:UIBarButtonItemStylePlain target:self action:@selector(userInfo)];
    

    self.navigationItem.leftBarButtonItem = itemleft;
    self.navigationItem.rightBarButtonItem = self.rightItem;
    
    // 接受通知
    [self getNotification];
    
}

- (void)userInfo{
    MMDrawerController *drawerVC = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [drawerVC toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)getNotification
{
    
    // 接受通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickMyMedicalRecoreCell) name:@"MyMedicalRecordNotification" object:nil];
    
    //AdvanceNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AdvanceNotification) name:@"AdvanceNotification" object:nil];
    
    //注册通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAdvanceCount) name:@"AdvanceCountNotification" object:nil];
    
    //SettingNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SettingNotification) name:@"SettingNotification" object:nil];
    
    // 未登录界面点击了登录按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotLoginCtldidClickLoginButton) name:@"NotLoginCtldidClickLoginButton" object:nil];
    
    // 未登录界面点击了登录按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotLoginCtldidClickRegistButton) name:@"NotLoginCtldidClickRegistButton" object:nil];
    //名医通申请按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FamousDoctotDidClickButton) name:@"FamousDoctorNotification" object:nil];
}

#pragma mark - 实现通知方法
- (void)FamousDoctotDidClickButton {
    [self userInfo];
    UIViewController *VC = [[FamousDoctorViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)SettingNotification
{
    [self userInfo];
    SettingController *vc = [[SettingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)addAdvanceCount
{


    [self.vc addAdvanceCount];
    
    
}
- (void)AdvanceNotification
{
    [self userInfo];
    [self.navigationController pushViewController:self.vc animated:YES];

    
}
-(void)didClickMyMedicalRecoreCell
{
    [self userInfo];
    MedicalManageController *medicalManage = [[MedicalManageController alloc] init];
    [self.navigationController pushViewController:medicalManage animated:YES];
}

// 跳转到登录控制器
-(void)NotLoginCtldidClickLoginButton
{
    [self userInfo];
    LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:YES];
}

// 跳转到注册控制器
-(void)NotLoginCtldidClickRegistButton
{
    [self userInfo];
    RegisterViewController *login = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:YES];
}

// 移除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
