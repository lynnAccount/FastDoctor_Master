//
//  UserInfoTableViewCell.m
//  FastDoctor
//
//  Created by 周泉龙 on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "UserInfoTableViewCell.h"

@interface UserInfoTableViewCell ()
/** 头像 */
@property(nonatomic, weak) UIImageView *iconView;
/** 姓名 */
@property(nonatomic, weak) UILabel *nameLabel;
/** 详细资料设置 */
@property(nonatomic, weak) UILabel *informationLabel;

/** 附件样式 */
@property(nonatomic, weak) UIImageView *accessaryView;

@end
@implementation UserInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


// 初始化重用cell
+(instancetype)initializeUserInforCell:(UITableView *)tableView reuseID:(NSString *)ID
{
    UserInfoTableViewCell *cell = [[UserInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }

    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        if ([reuseIdentifier isEqualToString:@"UserCellHeader"]) {// 表示是用户信息界面
            
            [self setUPHeaderCell];
        }else{// 表示是其他操作界面
            
            [self setUpNormalCell];
        }
    }
    return self;
}


// 创建详细资料cell控件
-(void)setUPHeaderCell
{
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UserIconImage"]];
    [self addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"隔壁老王";
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *informationLabel = [[UILabel alloc] init];
    informationLabel.text = @"用户详细信息";
    [self addSubview:informationLabel];
    self.informationLabel = informationLabel;
    
}

// 创建普通cell控件
-(void)setUpNormalCell
{
    UIImageView *accessaryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u28"]];
    [self addSubview:accessaryView];
    self.accessaryView = accessaryView;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // 普通cell的frame
    CGFloat accessaryX = [UIScreen mainScreen].bounds.size.width *0.65;
    CGFloat accessaryY = self.frame.size.height *0.5;
    CGFloat accessaryW = 10;
    CGFloat accessaryH = 10;
    self.accessaryView.frame = CGRectMake(accessaryX, accessaryY, accessaryW, accessaryH);
    
    if ( self.tag == 0 || self.tag == 6 || self.tag == 9) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessaryView.hidden = YES;
    }else {
        
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessaryView.hidden = NO;

    }
    
    // 设置用户详情控件位置
    //头像
    CGFloat iconX = 20;
    CGFloat iconY = 20;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 名字
    CGFloat nameIconX = CGRectGetMaxX(self.iconView.frame) + 10;
    CGFloat nameIconY = iconY - 10;
    CGFloat nameIconW = 100;
    CGFloat nameIconH = 35;
    self.nameLabel.frame = CGRectMake(nameIconX, nameIconY, nameIconW, nameIconH);
    
    // 基本资料
    CGFloat informationLabelX = nameIconX;
    CGFloat informationLabelY = CGRectGetMaxY(self.nameLabel.frame);
    CGFloat informationLabelH = 35;
    CGFloat informationLabelW = 200;
    self.informationLabel.frame = CGRectMake(informationLabelX, informationLabelY, informationLabelW, informationLabelH);
}

@end
