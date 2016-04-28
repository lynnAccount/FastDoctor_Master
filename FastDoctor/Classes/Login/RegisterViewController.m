//
//  RegisterViewController.m
//  test
//
//  Created by 周泉龙 on 16/4/21.
//  Copyright © 2016年 zhouquanlong. All rights reserved.
//

#import "RegisterViewController.h"
#import "QLSelectedButton.h"
#import "UITextField+Extension.h"
#import "RegistVerifyViewController.h"
#import "UIView+QLFrame.h"

#define textWidth self.locationTextFiled.width

@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
/** 真实姓名 */
@property (weak, nonatomic) IBOutlet UITextField *name;
/** 性别选择按钮 */
@property (weak, nonatomic) IBOutlet UIButton *sexSelectedButton;
/** 有效身份证 */
@property (weak, nonatomic) IBOutlet UITextField *idCardTextFiled;
/** 现居住地 */
@property (weak, nonatomic) IBOutlet UITextField *locationTextFiled;
/** 手机号 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFiled;
/** 验证码 */
@property (weak, nonatomic) IBOutlet UITextField *isRightTextFiled;
/** 下一步 */
@property (weak, nonatomic) IBOutlet UIButton *nextTempButton;
/** 居住地 */
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

/** 性别选择 */
@property(nonatomic, weak) UITableView *tableView;
/** 住址选择 */
@property(nonatomic, weak) UIPickerView *pickView;
/** 城市数组 */
@property(nonatomic, strong) NSArray *cities;

@end

@implementation RegisterViewController

#pragma mark - 懒加载
-(UITableView *)tableView
{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.sexSelectedButton.x, self.sexSelectedButton.y + 35, 60, 80)];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

-(UIPickerView *)pickView
{
    if (_pickView == nil) {
        UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(self.locationTextFiled.x + textWidth - 120, self.locationTextFiled.y - 100 + 28, 90, 180)];
        _pickView = pickView;
        [self.view addSubview:_pickView];
    }
    return _pickView;
}

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置UI
    [self setUpUI];
    
    self.cities = @[@"北京市",@"安徽省",@"天津市",@"河北省",@"四川省",@"陕西省",@"山西省"];
}

#pragma mark - 私有方法
-(void)setUpUI
{
    self.title = @"用户注册";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    [imageView sizeToFit];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    // 设置"先生"
    [self.sexSelectedButton setTitle:@"♂先生" forState:UIControlStateNormal];
    [self.sexSelectedButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [self.sexSelectedButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    // 设置"居住地址选择"按钮
    [self.locationButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [self.locationButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    // 设置textFiled
    [UITextField imageName:@"icon_logon" textFiled:self.name];
    [UITextField imageName:@"id" textFiled:self.idCardTextFiled];
    [UITextField imageName:@"mobile" textFiled:self.phoneNumberTextFiled];
    [UITextField imageName:@"clip" textFiled:self.isRightTextFiled];
    [UITextField imageName:@"pin" textFiled:self.locationTextFiled];
    
    // 设置用户交互事件
    self.locationTextFiled.enabled = NO;
}


-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 点击按钮

// 点击了性别选择按钮
- (IBAction)didClickSexButton:(QLSelectedButton *)sender {
    sender.selected = !sender.isSelected;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if (sender.selected) {
        self.tableView.hidden = NO;
    }else{
        self.tableView.hidden = YES;
        //        [self.tableView removeFromSuperview];
    }
}

// 点击了身份证按钮
- (IBAction)didClickIdCardButton:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"证件类型" message:@"请选择想要注册的证件类型" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"身份证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [sender setTitle:@"身份证" forState:UIControlStateNormal];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"驾驶证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [sender setTitle:@"驾驶证" forState:UIControlStateNormal];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"军官证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [sender setTitle:@"军官证" forState:UIControlStateNormal];
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
}
// 点击了"选择居住地按钮"
- (IBAction)didClickSelectedLoctionButton:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    if (sender.selected) {
        [self.view addSubview:self.pickView];
    }else{
        [self.pickView removeFromSuperview];
    }
    
    
}

// 点击了获取验证码按钮
- (IBAction)didClickGetIsRightNumberButton:(UIButton *)sender {
    NSLog(@"点击了获取验证码按钮");
}
// 同意"用户协议"
- (IBAction)selectedButton:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    self.nextTempButton.enabled = sender.selected;
    if (sender.selected) {
        self.nextTempButton.backgroundColor = [UIColor colorWithWhite:135/256.0 alpha:1];
    }else{
        self.nextTempButton.backgroundColor = [UIColor colorWithWhite:241/256.0 alpha:1];
    }
}
// 点击了"用户协议按钮"
- (IBAction)didClickRreatyButton:(UIButton *)sender {
    NSLog(@"点击了用户协议按钮");
}
// 点击了"下一步按钮"
- (IBAction)didClickNextTempButton:(UIButton *)sender {
    NSLog(@"点击了下一步按钮");
    RegistVerifyViewController *nextRegistVerifyCtl = [[RegistVerifyViewController alloc] init];
    [self.navigationController pushViewController:nextRegistVerifyCtl animated:YES];
}



#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"先生";
    }else
    {
        cell.textLabel.text = @"女士";
    }
    return cell;
}

#pragma mark - tableView代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableView.hidden = YES;
    self.sexSelectedButton.selected = NO;
    
    NSInteger index = [tableView indexPathForSelectedRow].row;
    NSString *cellStr;
    if (index == 0) {
        cellStr = @"♂先生";
    }else{
        cellStr = @"♀女士";
    }
    
    [self.sexSelectedButton setTitle:cellStr forState:UIControlStateNormal];
}

#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.cities.count;
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *city = self.cities[row];
    return city;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 35;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.pickView removeFromSuperview];
    NSString *city = self.cities[row];
    [self.locationTextFiled setText:city];
    self.locationButton.selected = NO;
}



@end
