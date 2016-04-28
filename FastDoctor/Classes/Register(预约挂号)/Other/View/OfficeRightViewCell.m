//
//  OfficeRightViewCell.m
//  01 科室查找
//
//  Created by wuxiaoling on 16/4/22.
//  Copyright © 2016年 wuxiaoling. All rights reserved.
//

#import "OfficeRightViewCell.h"
#import "DepartmentNetData.h"

@interface OfficeRightViewCell()

@end
@implementation OfficeRightViewCell

+ (instancetype)officeRightViewCellWith:(UITableView *)tableView{
    
    static NSString *ID = @"officeRightCell";
    OfficeRightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[OfficeRightViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];

    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
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
