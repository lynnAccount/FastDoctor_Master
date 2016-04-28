//
//  HospitalSmallHeader.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/23.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "HospitalSmallHeader.h"
#import "NSString+Rect.h"
@interface HospitalSmallHeader ()
@property (nonatomic, weak) UILabel *selectLbl;
@property (nonatomic, weak) UILabel *titleLbl;
@property (nonatomic, weak) UIView *buttomLine;


@end
@implementation HospitalSmallHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addAllSupviews];
    }
    return self;
}

- (void)addAllSupviews
{
    
    
    UILabel *selectLbl = [[UILabel alloc] init];
    selectLbl.font = [UIFont systemFontOfSize:14];
    [self addSubview:selectLbl];
    self.selectLbl = selectLbl;
    selectLbl.text = @"当前选择:";
    selectLbl.textColor = [UIColor colorWithRed:170/255.0 green:157/255.0 blue:153/255.0 alpha:1.0];

    
    UILabel *titleLbl = [[UILabel alloc] init];
    titleLbl.font = [UIFont systemFontOfSize:17];
    [self addSubview:titleLbl];
    self.titleLbl = titleLbl;
    titleLbl.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    
    
    UIView *buttomLine = [[UIView alloc] init];
    [self addSubview:buttomLine];
    self.buttomLine = buttomLine;
    buttomLine.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    
}

- (void)setCellText:(NSString *)cellText

{
    _cellText = cellText;
    self.titleLbl.text = cellText;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat magrin = 10;
    CGFloat selectX = magrin;
    CGFloat selectY = magrin;
    CGFloat selectH = 25;
    NSDictionary *attrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:14]};
    CGFloat selectW = [self.selectLbl.text rectOfStringWithMaxSize:CGSizeMake(200, selectH) andDict:attrs].size.width;
    
    self.selectLbl.frame = CGRectMake(selectX, selectY, selectW, selectH);
    
    
    CGFloat maxselectLblX = CGRectGetMaxX(self.selectLbl.frame);
    CGFloat titleX = magrin * 1.5 + maxselectLblX;
    CGFloat titleY = magrin;
    CGFloat titleH = 20;
    NSDictionary *titleAttrs = @{NSFontAttributeName :  [UIFont systemFontOfSize:17]};
    CGFloat titleW = [self.titleLbl.text rectOfStringWithMaxSize:CGSizeMake(270, titleH) andDict:titleAttrs ].size.width;
    
    self.titleLbl.frame = CGRectMake(titleX, titleY, titleW, titleH);


    CGFloat blX = 0;
    CGFloat blY = self.bounds.size.height - 1;
    CGFloat blW = self.bounds.size.width;
    CGFloat blH = 1;
    
    self.buttomLine.frame = CGRectMake(blX, blY, blW, blH);

}

@end
