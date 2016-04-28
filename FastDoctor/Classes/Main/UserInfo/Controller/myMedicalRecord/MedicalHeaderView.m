//
//  MedicalHeaderView.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "MedicalHeaderView.h"

@interface MedicalHeaderView ()
/** 头像 */
@property(nonatomic, weak) UIImageView *iconImageView;
/** 姓名 */
@property(nonatomic, weak) UILabel *nameLabel;
/** 性别头像 */
@property(nonatomic, weak) UIImageView *sexImageView;
/** 性别 */
@property(nonatomic, weak) UILabel *labelSex;
/** 地理位置头像 */
@property(nonatomic, weak) UIImageView *localImageView;
/** 地理位置 */
@property(nonatomic, weak) UILabel *localLabel;
/** 身份证号头像 */
@property(nonatomic, weak) UIImageView *IDCardImageView;
/** 身份证号 */
@property(nonatomic, weak) UILabel *IDLabel;
/** 手机头像 */
@property(nonatomic, weak) UIImageView *mobileImageView;
/** 手机号label */
@property(nonatomic, weak) UILabel *mobileLabel;

/** 修改个人病历label */
@property(nonatomic, weak) UILabel *personalMedicalLabel;
/** 上面线条 */
@property(nonatomic, weak) UIView *lineUp;
/** 下面线条 */
@property(nonatomic, weak) UIView *lineDown;




@end
@implementation MedicalHeaderView
//
//-(UILabel *)personalMedicalLabel
//{
//    if (_personalMedicalLabel == nil) {
//        UILabel *personalMedicalLabel = [[UILabel alloc] init];
//        self.personalMedicalLabel.text = @"修改个人信息";
//        _personalMedicalLabel = personalMedicalLabel;
//    }
//    return _personalMedicalLabel;
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor darkGrayColor];
        // 头像
        UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UserIconImage"]];
        self.iconImageView = iconImageView;
        [self addSubview:iconImageView];
        // 姓名
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"王先生";
        self.nameLabel = nameLabel;
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        // 性别头像
        UIImageView *sexImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_logon"]];
        self.sexImageView = sexImageView;
        [self addSubview:sexImageView];
        // 性别
        UILabel *labelSex = [[UILabel alloc] init];
        self.labelSex = labelSex;
        labelSex.text = @"男  24";
        [self addSubview:labelSex];
        // 地理位置头像
        UIImageView *localImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin"]];
        [self addSubview:localImageView];
        self.localImageView = localImageView;
        // 地理位置
        UILabel *localLabel = [[UILabel alloc] init];
        localLabel.text = @"北京市";
        self.localLabel = localLabel;
        [self addSubview:localLabel];
        // 身份证号头像
        UIImageView *IDCardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"id"]];
        self.IDCardImageView = IDCardImageView;
        [self addSubview:IDCardImageView];
        // 身份证号
        UILabel *IDLabel = [[UILabel alloc] init];
        IDLabel.text = @"360302888888888";
        self.IDLabel = IDLabel;
        [self addSubview:IDLabel];
        // 手机头像
        UIImageView *mobileImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mobile"]];
        self.mobileImageView = mobileImageView;
        [self addSubview:mobileImageView];
        // 手机号label
        UILabel *mobileLabel = [[UILabel alloc] init];
        mobileLabel.text = @"13288888888";
        self.mobileLabel = mobileLabel;
        [self addSubview:mobileLabel];
        
        UILabel *personalMedicalLabel = [[UILabel alloc] init];
        self.personalMedicalLabel = personalMedicalLabel;
        self.personalMedicalLabel.text = @"修改个人信息";
        self.personalMedicalLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.personalMedicalLabel];
        self.personalMedicalLabel.text = @"修改个人信息";
//        self.personalMedicalLabel.backgroundColor = [UIColor redColor];
        
        // 上面线条
        UIView *lineUp = [[UIView alloc] init];
        self.lineUp = lineUp;
        lineUp.backgroundColor = [UIColor grayColor];
        [self addSubview:lineUp];
        
        // 下面线条
        UIView *lineDown = [[UIView alloc] init];
        self.lineDown = lineDown;
        lineDown.backgroundColor = [UIColor blackColor];
        [self addSubview:lineDown];
    }
    
    return self;
}

// 布局参数
-(void)layoutSubviews
{
    [super layoutSubviews];
    // 头像
    CGFloat iconImageViewX = 20;
    CGFloat iconImageViewY = 10;
    CGFloat iconImageViewW = 80;
    CGFloat iconImageViewH = 80;
    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    
    // 姓名
    CGFloat nameLabelX = iconImageViewX;
    CGFloat nameLabelY = CGRectGetMaxY(self.iconImageView.frame) + 10;
    CGFloat nameLabelW = iconImageViewW;
    CGFloat nameLabelH = 24;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    // 性别头像
    CGFloat sexImageViewX = CGRectGetMaxX(self.iconImageView.frame) + 20;
    CGFloat sexImageViewY = iconImageViewY;
    CGFloat sexImageViewW = 20;
    CGFloat sexImageViewH = 20;
    self.sexImageView.frame = CGRectMake(sexImageViewX, sexImageViewY, sexImageViewW, sexImageViewH);
    
    // 性别label
    CGFloat labelSexX = CGRectGetMaxX(self.sexImageView.frame) + 10;
    CGFloat labelSexY = sexImageViewY;
    CGFloat labelSexW = 160;
    CGFloat labelSexH = 20;
    self.labelSex.frame = CGRectMake(labelSexX, labelSexY, labelSexW, labelSexH);
    
    // 地理位置头像
    CGFloat localImageViewX = sexImageViewX;
    CGFloat localImageViewY = CGRectGetMaxY(self.sexImageView.frame) + 10;
    CGFloat localImageViewW = sexImageViewW;
    CGFloat localImageViewH = sexImageViewH;
    self.localImageView.frame = CGRectMake(localImageViewX, localImageViewY, localImageViewW, localImageViewH);
    
    // 地理位置label
    CGFloat localLabelX = labelSexX;
    CGFloat localLabelY = localImageViewY;
    CGFloat localLabelW = labelSexW;
    CGFloat localLabelH = labelSexH;
    self.localLabel.frame = CGRectMake(localLabelX, localLabelY, localLabelW, localLabelH);
    
    // 身份证头像
    CGFloat IDCardImageViewX = sexImageViewX;
    CGFloat IDCardImageViewY = CGRectGetMaxY(self.localImageView.frame) + 10;
    CGFloat IDCardImageViewW = sexImageViewW;
    CGFloat IDCardImageViewH = sexImageViewH;
    self.IDCardImageView.frame = CGRectMake(IDCardImageViewX, IDCardImageViewY, IDCardImageViewW, IDCardImageViewH);
    
    // 身份证号
    CGFloat IDLabelX = labelSexX;
    CGFloat IDLabelY = IDCardImageViewY;
    CGFloat IDLabelW = labelSexW;
    CGFloat IDLabelH = labelSexH;
    self.IDLabel.frame = CGRectMake(IDLabelX, IDLabelY, IDLabelW, IDLabelH);
    
    // 手机头像
    CGFloat mobileImageViewX = sexImageViewX;
    CGFloat mobileImageViewY = CGRectGetMaxY(self.IDCardImageView.frame) + 10;
    CGFloat mobileImageViewW = sexImageViewW;
    CGFloat mobileImageViewH = sexImageViewH;
    self.mobileImageView.frame = CGRectMake(mobileImageViewX, mobileImageViewY, mobileImageViewW, mobileImageViewH);
    
    // 手机号
    CGFloat mobileLabelX = labelSexX;
    CGFloat mobileLabelY = mobileImageViewY;
    CGFloat mobileLabelW = labelSexW;
    CGFloat mobileLabelH = labelSexH;
    self.mobileLabel.frame = CGRectMake(mobileLabelX, mobileLabelY, mobileLabelW, mobileLabelH);
    
    // 修改个人病历
    CGFloat personalMedicalLabelX = 0;
    CGFloat personalMedicalLabelY = CGRectGetMaxY(self.nameLabel.frame) + 2;
    CGFloat personalMedicalLabelW = [UIScreen mainScreen].bounds.size.width;
    CGFloat personalMedicalLabelH = self.frame.size.height - personalMedicalLabelY - 2;
    self.personalMedicalLabel.frame = CGRectMake(personalMedicalLabelX, personalMedicalLabelY, personalMedicalLabelW, personalMedicalLabelH);
    
    // 上面线条
    self.lineUp.frame = CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), personalMedicalLabelW, 2);
    // 下面线条
    self.lineDown.frame = CGRectMake(0, CGRectGetMaxY(self.personalMedicalLabel.frame), personalMedicalLabelW, 2);
}




@end
