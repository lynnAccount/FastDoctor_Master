//
//  OfficeLeftViewCell.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "OfficeLeftViewCell.h"

@implementation OfficeLeftViewCell

+ (instancetype)officeLeftViewCellWith:(UITableView *)tableView
{
    static NSString *ID = @"OfficeLeftViewCell";
    
    OfficeLeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[OfficeLeftViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
