//
//  MessageView.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "MessageView.h"
@interface MessageView()
@property (nonatomic, weak) UIImageView *img;

@property (nonatomic, weak) UILabel *titleLbl;
@property (nonatomic, weak) UILabel *detailLbl;
@end
@implementation MessageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *img = [[UIImageView alloc] init];
        [self addSubview:img];
        self.img = img;
        self.img.image = [UIImage imageNamed:@"Massage"];
        
        UILabel *titleLbl = [[UILabel alloc] init];
        [self addSubview:titleLbl];
        self.titleLbl = titleLbl;
        titleLbl.font = [UIFont systemFontOfSize:17];
        [titleLbl sizeToFit];
        
        titleLbl.text = @"新增医院";
        titleLbl.numberOfLines = 1;
        titleLbl.textColor = [UIColor colorWithRed:78/255.0 green:158/255.0 blue:215/255.0 alpha:1.0];
        
        
        UILabel *detailLbl = [[UILabel alloc] init];
        [self addSubview:detailLbl];
        self.detailLbl = detailLbl;
        
        detailLbl.font = [UIFont systemFontOfSize:14];
        [detailLbl sizeToFit];
        detailLbl.text = @"你三次金山毒霸v上电脑v你就分四部v是DV不断进步v句你的v是的女方便v你的代表陈么事电饭锅v吃产生的句不懂什么v不难道是";
        detailLbl.textColor = [UIColor colorWithRed:157/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
        detailLbl.numberOfLines = 2;
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    CGFloat imgX = margin;
    CGFloat imgY = margin;
    CGFloat imgW = 20;
    CGFloat imgH = imgW;
    self.img.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    
    CGFloat titleX = margin * 2 + imgW;
    CGFloat titleY = imgY;
    
    self.titleLbl.frame = (CGRect){titleX, titleY,100,20};
    
    
    CGFloat maxImgY = CGRectGetMaxY(self.img.frame);
    
    CGFloat detailX = margin;
    CGFloat detailY = maxImgY;
    CGFloat detailW = self.bounds.size.width - 2 *margin;
    self.detailLbl.frame = (CGRect){detailX, detailY,detailW,60};
}


@end
