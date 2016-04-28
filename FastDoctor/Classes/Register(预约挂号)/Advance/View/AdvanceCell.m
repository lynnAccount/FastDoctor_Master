//
//  AdvanceCell.m
//  FastDoctor
//
//  Created by wuxiaoling on 16/4/24.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "AdvanceCell.h"

#import "AdvanceView.h"
@interface AdvanceCell ()
@property (nonatomic, weak) AdvanceView *view;

@end
@implementation AdvanceCell

+ (instancetype)advanceCellWith:(UITableView *)tableView
{
    static NSString *ID = @"AdvanceCell";
    AdvanceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[AdvanceCell alloc] initWithStyle:1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

#pragma 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        AdvanceView *viewCell = [[AdvanceView alloc] init];
        
        [self.contentView addSubview:viewCell];
        self.view = viewCell;
        
        
        viewCell.backgroundColor = [UIColor whiteColor];
        
        
        }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 15;
    CGFloat w = self.bounds.size.width - 2 *margin;
    CGFloat h = self.bounds.size.height - margin;
    CGFloat x = margin;
    CGFloat y = margin;
    
    self.view.frame = CGRectMake(x, y, w, h);

}


@end
