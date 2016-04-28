//
//  NotLogonTableViewCell.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "NotLogonTableViewCell.h"

@interface NotLogonTableViewCell ()
/** 头像 */
@property(nonatomic, weak) UIImageView *iconImageView;
/** 姓名label */
@property(nonatomic, weak) UILabel *nameLabel;
/** 登录按钮 */
@property(nonatomic, weak) UIButton *logonButton;
/** 注册按钮 */
@property(nonatomic, weak) UIButton *registButton;

/** 附件 */
@property(nonatomic, weak) UIImageView *accessaryImageView;


@end

@implementation NotLogonTableViewCell


+(instancetype)initializeUserUnLogonInforCell:(UITableView *)tableView reuseID:(NSString *)ID
{
     NotLogonTableViewCell *cell = [[NotLogonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        if ([reuseIdentifier isEqualToString:@"UserCellNotLogonHeader"]) {
            // 返回header cell
            [self setUPHeaderCell];
        }else{
            [self setUpNormalCell];
        }
    
    }
    return self;
}

// 添加header控件
-(void)setUPHeaderCell
{
    // 头像
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    [self addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    // 姓名
    UILabel *nameLabel = [[UILabel alloc] init];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    nameLabel.text = @"未登录";
    
    // 登录按钮
    UIButton *logonButton = [[UIButton alloc] init];
    self.logonButton = logonButton;
    [self addSubview:logonButton];
    [logonButton setTitle:@"登录" forState:UIControlStateNormal];
    logonButton.backgroundColor = [UIColor grayColor];
    self.logonButton.layer.cornerRadius = 7;
    self.logonButton.clipsToBounds = YES;
    [logonButton addTarget:self action:@selector(didClickLogonButton) forControlEvents:UIControlEventTouchUpInside];
    
    // 注册按钮
    UIButton *registButton = [[UIButton alloc] init];
    self.registButton = registButton;
    [self addSubview:registButton];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    registButton.backgroundColor = [UIColor grayColor];
    self.registButton.layer.cornerRadius = 7;
    self.registButton.clipsToBounds = YES;
    [registButton addTarget:self action:@selector(didClickRegistButton) forControlEvents:UIControlEventTouchUpInside];
    
}

// 添加普通cell控件
-(void)setUpNormalCell
{
    UIImageView *accessaryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right"]];
    [self addSubview:accessaryImageView];
    self.accessaryImageView = accessaryImageView;
}

// 点击了登录按钮
-(void)didClickLogonButton
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotLoginCtldidClickLoginButton" object:nil];
}

// 点击了注册按钮
-(void)didClickRegistButton
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotLoginCtldidClickRegistButton" object:nil];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    if (self.tag == 3 || self.tag == 0) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessaryImageView.hidden = YES;
    }else {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessaryImageView.hidden = NO;
    }
    
    // 头像
    CGFloat iconImageViewX = 0.3 *screenWidth;
    CGFloat iconImageViewY = 20;
    CGFloat iconImageViewW = 45;
    CGFloat iconImageViewH = 40;
    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    
    // 名字
    CGFloat nameLabelX = iconImageViewX - 3;
    CGFloat nameLabelY = CGRectGetMaxY(self.iconImageView.frame) + 5;
    CGFloat nameLabelW = 60;
    CGFloat nameLabelH = 24;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    // 登录按钮
    CGFloat logonButtonX = iconImageViewX - 40;
    CGFloat logonButtonY = CGRectGetMaxY(self.nameLabel.frame) + 5;
    CGFloat logonButtonW = 60;
    CGFloat logonButtonH = 24;
    self.logonButton.frame = CGRectMake(logonButtonX, logonButtonY, logonButtonW, logonButtonH);
    
    // 注册按钮
    CGFloat registButtonX = CGRectGetMaxX(self.logonButton.frame) +5;
    CGFloat registButtonY = logonButtonY;
    CGFloat registButtonW = logonButtonW;
    CGFloat registButtonH = logonButtonH;
    self.registButton.frame = CGRectMake(registButtonX, registButtonY, registButtonW, registButtonH);
    
    // 附件
    CGFloat accessaryImageViewX = self.frame.size.width *0.9;
    CGFloat accessaryImageViewY = 10;
    CGFloat accessaryImageViewW = 20;
    CGFloat accessaryImageViewH = 20;
    self.accessaryImageView.frame = CGRectMake(accessaryImageViewX, accessaryImageViewY, accessaryImageViewW, accessaryImageViewH);
    
}


@end
