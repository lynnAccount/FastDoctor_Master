//
//  SelectedDoctorViewCell.m
//  FastDoctor
//
//  Created by Macdav on 16/4/25.
//  Copyright © 2016年 01Group. All rights reserved.
//

#import "SelectedDoctorViewCell.h"

@interface SelectedDoctorViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
@implementation SelectedDoctorViewCell

- (void)awakeFromNib {
    // Initialization code
}
+ (instancetype)selectedDoctorCellWithTableView:(UITableView *)tableView {
    
    
    static NSString *selectedDoctorID = @"selectedDoctorID";
    SelectedDoctorViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectedDoctorID ];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SelectedDoctorViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
