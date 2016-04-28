//
//  MessageCell.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "MessageCell.h"
#import "MessageView.h"
@interface MessageCell ()

@property (nonatomic, weak) MessageView *view;
@property (nonatomic, weak) UIImageView *img;

@end
@implementation MessageCell
+ (instancetype)messageCellWith:(UITableView *)tableView
{
    static NSString *ID = @"MessageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[MessageCell alloc] initWithStyle:1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return cell;
}

#pragma 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        MessageView *viewCell = [[MessageView alloc] init];
        
        [self.contentView addSubview:viewCell];
        self.view = viewCell;
        
        
        viewCell.layer.cornerRadius = 10;
        viewCell.clipsToBounds = YES;
        
        viewCell.backgroundColor = [UIColor whiteColor];
        
        
        //创建小球
        UIImageView *img = [[UIImageView alloc] init];
        
        [self.contentView addSubview:img];
        img.backgroundColor = [UIColor colorWithRed:255/255.0 green:152/255.0 blue:154/255.0 alpha:1];
        self.img = img;
        
        img.layer.cornerRadius = 7.5;
        img.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 15;
    CGFloat w = self.bounds.size.width - margin * 2;
    CGFloat h = self.bounds.size.height - margin * 2;
    CGFloat x = margin;
    CGFloat y = margin;
    
    self.view.frame = CGRectMake(x, y, w, h);
    
    CGFloat imgX = CGRectGetMaxX(self.view.frame);
    self.img.frame = CGRectMake(imgX - 12, 8, 15, 15);
    
    
}


@end
