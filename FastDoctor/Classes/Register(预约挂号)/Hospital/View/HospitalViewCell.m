//
//  HospitalViewCell.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "HospitalViewCell.h"
#import "NSString+Rect.h"

@interface HospitalViewCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *titleLbl;
@property (nonatomic, weak) UILabel *detailLbl;

@property (nonatomic, weak) UIImageView *mapView;
@property (nonatomic, weak) UILabel *mapTitleLbl;

@end
@implementation HospitalViewCell

+ (instancetype)hospitalViewCellWith:(UITableView *)tableView
{
    static NSString *ID = @"hospitalViewCell";
    HospitalViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HospitalViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpAllSubviews];
    }
    return self;
}

- (void)setUpAllSubviews
{
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    iconView.image = [UIImage imageNamed:@"hospatial_placeHoder"];
    
    UILabel *titleLbl = [[UILabel alloc] init];
    [self.contentView addSubview:titleLbl];
    self.titleLbl = titleLbl;
    titleLbl.text = [NSString stringWithFormat:@"北京协和医院"];
    titleLbl.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    titleLbl.font = [UIFont systemFontOfSize:14];
    
    UILabel *detailLbl = [[UILabel alloc] init];
    [self.contentView addSubview:detailLbl];
    self.detailLbl = detailLbl;
    detailLbl.text = [NSString stringWithFormat:@"三级甲等"];
    detailLbl.textColor = [UIColor colorWithRed:165/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    detailLbl.font = [UIFont systemFontOfSize:14];
    
    
    
    UIImageView *mapView = [[UIImageView alloc] init];
    [self.contentView addSubview:mapView];
    self.mapView = mapView;
    mapView.image = [UIImage imageNamed:@"hospital_map"];
    
    UILabel *mapTitleLbl = [[UILabel alloc] init];
    [self.contentView addSubview:mapTitleLbl];
    self.mapTitleLbl = mapTitleLbl;
    mapTitleLbl.text = [NSString stringWithFormat:@"北京市东城区帅府园一号  1km"];
    mapTitleLbl.textColor = [UIColor colorWithRed:0/255.0 green:158/255.0 blue:215/255.0 alpha:1.0];
    mapTitleLbl.font = [UIFont systemFontOfSize:14];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat magrin = 10;
    CGFloat iconX = magrin;
    CGFloat iconY = magrin;
    CGFloat iconW = 50;
    CGFloat iconH = iconW;
    
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    
    CGFloat maxIconX = CGRectGetMaxX(self.iconView.frame);
    CGFloat titleX = magrin + maxIconX;
    CGFloat titleY = magrin;
    CGFloat titleH = 25;
    NSDictionary *attrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat titleW = [self.titleLbl.text rectOfStringWithMaxSize:CGSizeMake(200, titleH) andDict:attrs].size.width;
    
    self.titleLbl.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    CGFloat maxtitleX = CGRectGetMaxX(self.titleLbl.frame);
    CGFloat detailX = magrin + maxtitleX;
    CGFloat detailY = titleY;
    CGFloat detailH  = 25;
    
    NSDictionary *detailattrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat detailW = [self.detailLbl.text rectOfStringWithMaxSize:CGSizeMake(200, detailH) andDict:detailattrs].size.width;
    self.detailLbl.frame = CGRectMake(detailX, detailY, detailW, detailH);
    
    
    
    CGFloat maxdetailY = CGRectGetMaxY(self.detailLbl.frame);
    
    CGFloat mapViewX = titleX - 7;
    CGFloat mapViewY =  maxdetailY + 6;
    CGFloat mapViewW = 25;
    CGFloat mapViewH = 25;
    
    self.mapView.frame = CGRectMake(mapViewX, mapViewY, mapViewW, mapViewH);
    
    
    
    CGFloat maxMapViewX = CGRectGetMaxX(self.mapView.frame);
    CGFloat mTLX = maxMapViewX;
    CGFloat mTLY = mapViewY;
    CGFloat mTLW ;
    CGFloat mTLH = 25;
    
    NSDictionary *mTLattrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    mTLW = [self.mapTitleLbl.text rectOfStringWithMaxSize:CGSizeMake(200, mTLH) andDict:mTLattrs].size.width;
    self.mapTitleLbl.frame = CGRectMake(mTLX, mTLY, mTLW, mTLH);
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
