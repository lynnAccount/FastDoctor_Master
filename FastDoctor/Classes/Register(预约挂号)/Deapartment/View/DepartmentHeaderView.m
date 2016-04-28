//
//  DepartmentHeaderView.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "DepartmentHeaderView.h"
#import "NSString+Rect.h"
@interface DepartmentHeaderView ()

@property (nonatomic, weak) UILabel *titleLbl;
@property (nonatomic, weak) UILabel *detailLbl;

@property (nonatomic, weak) UIImageView *mapView;
@property (nonatomic, weak) UILabel *mapTitleLbl;
@property (nonatomic, weak) UIButton *detailbtn;


@end
@implementation DepartmentHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self addAllSupviews];
    }
    return self;
}

- (void)addAllSupviews
{
    UILabel *titleLbl = [[UILabel alloc] init];
    [self addSubview:titleLbl];
    self.titleLbl = titleLbl;
    titleLbl.text = [NSString stringWithFormat:@"北京协和医院"];
    titleLbl.textColor = [UIColor colorWithRed:110/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    titleLbl.font = [UIFont systemFontOfSize:17];
    
    UILabel *detailLbl = [[UILabel alloc] init];
    [self addSubview:detailLbl];
    self.detailLbl = detailLbl;
    detailLbl.text = [NSString stringWithFormat:@"三级甲等"];
    detailLbl.textColor = [UIColor colorWithRed:165/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    detailLbl.font = [UIFont systemFontOfSize:14];
    
    
    
    UIImageView *mapView = [[UIImageView alloc] init];
    [self addSubview:mapView];
    self.mapView = mapView;
    mapView.image = [UIImage imageNamed:@"hospital_map"];
    
    UILabel *mapTitleLbl = [[UILabel alloc] init];
    [self addSubview:mapTitleLbl];
    self.mapTitleLbl = mapTitleLbl;
    mapTitleLbl.text = [NSString stringWithFormat:@"北京市东城区帅府园一号  1km"];
    mapTitleLbl.textColor = [UIColor colorWithRed:0/255.0 green:158/255.0 blue:215/255.0 alpha:1.0];
    mapTitleLbl.font = [UIFont systemFontOfSize:14];
    
    
    UIButton *detailbtn = [[UIButton alloc] init];
    
    [self addSubview:detailbtn];
    self.detailbtn = detailbtn;
    [detailbtn setTitle:@"查看医院详情" forState:UIControlStateNormal];
    [detailbtn setTitleColor:[UIColor colorWithRed:0/255.0 green:158/255.0 blue:215/255.0 alpha:1.0] forState:UIControlStateNormal];
    detailbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //[detailbtn sizeToFit];

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat magrin = 10;
    
    CGFloat titleX = magrin;
    CGFloat titleY = magrin;
    CGFloat titleH = 25;
    NSDictionary *attrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:17]};
    CGFloat titleW = [self.titleLbl.text rectOfStringWithMaxSize:CGSizeMake(200, titleH) andDict:attrs].size.width;
    
    self.titleLbl.frame = CGRectMake(titleX, titleY, titleW, titleH);

    
    
   
    
    
    CGFloat maxtitleX = CGRectGetMaxX(self.titleLbl.frame);
    CGFloat detailX = magrin + maxtitleX;
    CGFloat detailY = titleY;
    CGFloat detailH  = 25;
    
    NSDictionary *detailattrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat detailW = [self.detailLbl.text rectOfStringWithMaxSize:CGSizeMake(200, detailH) andDict:detailattrs].size.width;
    self.detailLbl.frame = CGRectMake(detailX, detailY, detailW, detailH);
    
    
    
    
    CGFloat detailbtnY = titleY;
    CGFloat detailbtnH  = 25;
    NSDictionary *detailbtnAttrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat detailbtnW = [self.detailbtn.titleLabel.text rectOfStringWithMaxSize:CGSizeMake(200, detailbtnH) andDict:detailbtnAttrs].size.width;
    
    CGFloat detailbtnX = self.bounds.size.width - magrin - detailbtnW;
    self.detailbtn.frame = CGRectMake(detailbtnX, detailbtnY, detailbtnW, detailbtnH);
    

    CGFloat maxdetailY = CGRectGetMaxY(self.detailLbl.frame);
    CGFloat mapViewX = titleX;
    CGFloat mapViewY = magrin + maxdetailY;
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


@end
