//
//  AdvanceView.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "AdvanceView.h"
#import "NSString+Rect.h"

@interface AdvanceView ()
@property (nonatomic, weak) UILabel *titleLbl;
@property (nonatomic, weak) UILabel *detailLbl;

@property (nonatomic, weak) UILabel *mapTitleLbl;

@end
@implementation AdvanceView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpAllSubviews];
    }
    return self;
}

- (void)setUpAllSubviews
{
    
    
    UILabel *titleLbl = [[UILabel alloc] init];
    [self addSubview:titleLbl];
    self.titleLbl = titleLbl;
    titleLbl.text = [NSString stringWithFormat:@"北京协和医院"];
    titleLbl.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    titleLbl.font = [UIFont systemFontOfSize:15];
    
    UILabel *detailLbl = [[UILabel alloc] init];
    [self addSubview:detailLbl];
    self.detailLbl = detailLbl;
    detailLbl.text = [NSString stringWithFormat:@"主任医生"];
    detailLbl.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    detailLbl.font = [UIFont systemFontOfSize:14];
    
    UILabel *mapTitleLbl = [[UILabel alloc] init];
    [self addSubview:mapTitleLbl];
    self.mapTitleLbl = mapTitleLbl;
    mapTitleLbl.text = [NSString stringWithFormat:@"就诊时间: 2015-06-01上午"];
    mapTitleLbl.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    mapTitleLbl.font = [UIFont systemFontOfSize:14];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat magrin = 10;
    CGFloat titleX = magrin;
    CGFloat titleY = magrin;
    CGFloat titleH = 25;
    NSDictionary *attrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:15]};
    CGFloat titleW = [self.titleLbl.text rectOfStringWithMaxSize:CGSizeMake(200, titleH) andDict:attrs].size.width;
    self.titleLbl.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    CGFloat maxtitleY = CGRectGetMaxY(self.titleLbl.frame);
    CGFloat detailX = magrin;
    CGFloat detailY = maxtitleY + magrin;
    CGFloat detailH  = 25;
    NSDictionary *detailattrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat detailW = [self.detailLbl.text rectOfStringWithMaxSize:CGSizeMake(200, detailH) andDict:detailattrs].size.width;
    self.detailLbl.frame = CGRectMake(detailX, detailY, detailW, detailH);
    
    
    CGFloat mTLY = detailY;
    CGFloat mTLW ;
    CGFloat mTLH = 25;
    NSDictionary *mTLattrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    mTLW = [self.mapTitleLbl.text rectOfStringWithMaxSize:CGSizeMake(200, mTLH) andDict:mTLattrs].size.width;
    CGFloat mTLX = self.bounds.size.width - magrin - mTLW;

    self.mapTitleLbl.frame = CGRectMake(mTLX, mTLY, mTLW, mTLH);
    
}
@end
