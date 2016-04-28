//
//  DiseaseDetailViewController.m
//  FastDoctor
//
//  Created by Macdav on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//
#define MAS_SHORTHAND

#define MAS_SHORTHAND_GLOBALS

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "DiseaseDetailViewController.h"
#import "DetailViewController.h"
#import "SelectedMoreViewController.h"
#import "SelectedDoctorViewController.h"
#import "Masonry.h"

@interface DiseaseDetailViewController()
//用户名称信息
@property (weak, nonatomic) IBOutlet UILabel *labelSir;
//选择疾病细分按钮
@property (weak, nonatomic) IBOutlet UIButton *choiceDisease;
//选择疾病细分按钮左边的图片
@property (weak, nonatomic) IBOutlet UIImageView *ChoiceImageView;
//是否确诊按钮
@property (weak, nonatomic) IBOutlet UIButton *isTreat;
//是否接收治疗按钮
@property (weak, nonatomic) IBOutlet UIButton *didTreat;
//选择治疗方式的view
@property (weak, nonatomic) IBOutlet UIView *treatStyleView;
//选择治疗方式的按钮
@property (weak, nonatomic) IBOutlet UIButton *treatStyle;
//选择并发症状view
@property (weak, nonatomic) IBOutlet UIView *selectedMoreView;
//选择并发症状按钮
@property (weak, nonatomic) IBOutlet UIButton *selecedMore;
//选择更多按钮后面的(更多)label
@property (weak, nonatomic) IBOutlet UILabel *selectMorelbl;
//就诊申请按钮
@property (weak, nonatomic) IBOutlet UIButton *applyTreatBtn;
//记录选择治疗方式按钮的状态
@property (assign, nonatomic,getter = isShowStyle) BOOL showStyle;
//选择就诊类型
@property (nonatomic, strong)UIView *styleView;
//记录移动后选择更多按钮的frame
@property (nonatomic, assign)CGRect frame;
@end
@implementation DiseaseDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupDiseaseDetailMsg];
    
    [self getNote];

}
//接收通知
- (void)getNote{
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //接收疾病详情通知
    [center addObserver:self selector:@selector(changeDisease:) name:@"DiseaseDetailCellDidClick" object:nil];
    //选择更多症状通知
    [center addObserver:self selector:@selector(selectedMore:) name:@"SelectedMoreCell" object:nil];

}
//接收疾病详情通知
- (void)changeDisease:(NSNotification *)note{
    
    self.ChoiceImageView.hidden = YES;
    
    self.choiceDisease.titleLabel.text = note.userInfo[@"disease"];
    
        self.applyTreatBtn.selected = YES;
    
    [self.applyTreatBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
}
//选择更多症状通知
- (void)selectedMore:(NSNotification *)note{
    
    self.selectMorelbl.hidden = YES;
    
    [self.selecedMore setTitle:note.userInfo[@"selectedMoreMsg"] forState:UIControlStateSelected];
    self.selecedMore.selected = YES;
    
    self.applyTreatBtn.selected = YES;
    
    [self.applyTreatBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
}
//点击了是的就诊按钮
- (IBAction)isTrearBtn:(UIButton *)sender {
    
    sender.selected = YES;
    
    [sender setTitle:@"症状疑似" forState:UIControlStateSelected];
    
    [sender setHighlighted:NO];

}

//点击并发症状按钮
- (IBAction)selectedMoreBtn:(UIButton *)sender {
    
    UITableViewController *tabVC = [[SelectedMoreViewController alloc] init];
    
    [self.navigationController pushViewController:tabVC animated:YES];
}
//选择治疗方式
- (IBAction)choiceTreatStyleBtn:(UIButton *)sender {
    
    self.selectedMoreView.hidden = YES;
    
    UIView *View01 = [[UIView alloc] init];
    View01.backgroundColor = [UIColor whiteColor];
    View01.layer.borderWidth = 1.0f;
    [self.view addSubview:View01];
    
    [View01 makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(self.treatStyle.bounds.size.width, 120));
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.treatStyle).offset(self.treatStyle.frame.origin.y + 73);
    }];
    
    self.styleView = View01;
    
    UIButton *button01 = [[UIButton alloc] init];
    [button01 setTitle:@"手术治疗" forState:UIControlStateNormal];
    [button01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.styleView addSubview:button01];
    
    [button01 makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.styleView);
        make.top.equalTo(self.styleView);
        make.height.equalTo(40);
    }];
    
    UIButton *button02 = [[UIButton alloc] init];
    [button02 setTitle:@"保守治疗" forState:UIControlStateNormal];
    [button02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.styleView addSubview:button02];
    
    [button02 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button01);
        make.top.equalTo(button01.bottom);
        make.right.equalTo(button01);
        make.height.equalTo(40);
    }];
    
    UIButton *button03 = [[UIButton alloc] init];
    [button03 setTitle:@"药物治疗" forState:UIControlStateNormal];
    [button03 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.styleView addSubview:button03];
    [button03 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button01);
        make.top.equalTo(button02.bottom);
        make.right.equalTo(button02);
        make.height.equalTo(40);
    }];
    
    button01.tag = 0;
    button02.tag = 1;
    button03.tag = 2;
    
    [button01 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button02 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button03 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
}
//点击按钮执行的方法
- (void)clickButton:(UIButton *)sender{
    self.styleView.hidden = YES;
    [self.treatStyle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    switch (sender.tag) {
        case 0:
            [self.treatStyle setTitle:@"手术治疗" forState:UIControlStateNormal];
            break;
        case 1:
            [self.treatStyle setTitle:@"保守治疗" forState:UIControlStateNormal];
            break;
        case 2:
            [self.treatStyle setTitle:@"药物治疗" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
//点击疾病细分按钮
- (IBAction)choiceDiseaseBtn:(id)sender {
    
    UITableViewController *tb = [[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:tb animated:YES];
}
//点击选择是否接受治疗按钮
- (IBAction)didClickTreatbtn:(UIButton *)sender {
    
    
    if (self.showStyle == YES) {
        self.showStyle = NO;
        self.treatStyleView.hidden = YES;
        
        [UIView animateWithDuration:0.5 animations:^{

            CGRect rect = self.selectedMoreView.frame;
            rect.origin.y -= 60;
            self.selectedMoreView.frame = rect;
        }];

    }else{
    
    self.showStyle = YES;
        
    self.treatStyleView.hidden = NO;
 
    [UIView animateWithDuration:0.5 animations:^{
  
        CGRect rect = self.selectedMoreView.frame;
        rect.origin.y += 60;
        self.selectedMoreView.frame = rect;
        
        self.frame = rect;
        
        sender.userInteractionEnabled = NO;
    }];
    }
    
}
//点击就诊申请按钮
- (IBAction)ApplyTreatBtn:(UIButton *)sender {
    
    UITableViewController *tabVC = [[SelectedDoctorViewController alloc] init];
    [self.navigationController pushViewController:tabVC animated:YES];
}

- (void)setupDiseaseDetailMsg{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"病历详情选择";
    //修改导航栏文字颜色
    NSDictionary *titleAttributes = @{@"NSForegroundColorAttributeName":[UIColor lightGrayColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:titleAttributes];
    
    self.choiceDisease.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.choiceDisease.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.labelSir.layer.borderWidth = 1.0f;
    self.choiceDisease.layer.borderWidth = 1.0f;
    self.isTreat.layer.borderWidth = 1.0f;
    self.didTreat.layer.borderWidth = 1.0f;
    self.treatStyle.layer.borderWidth = 1.0f;
    self.selecedMore.layer.borderWidth = 1.0f;
    self.treatStyleView.hidden = YES;
    self.selectedMoreView.hidden = NO;

}
//移除通知
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
