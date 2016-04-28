//
//  InfoButton.m
//  FastDoctor
//
//  Created by Captain-Lee on 16/4/21.
//  Copyright © 2016年 lynn. All rights reserved.
//

#import "InfoButton.h"

@interface InfoButton ()

@property (nonatomic,weak) UIButton *infoButton;
@property (nonatomic,weak) UIImageView *imgView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *baseBtn;


@end

@implementation InfoButton

+ (InfoButton *)setUpInfoButton {

    InfoButton *infoButton = [[InfoButton alloc] init];
    infoButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 26, 60, 60)];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 22, 100, 30)];
    UIButton *baseBtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 60, 150, 30)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.text = @"王先生";
//    baseBtn.titleLabel.text = @"基本资料设置";
    [baseBtn setTitle:@"基本资料设置" forState:UIControlStateNormal];
    [baseBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    imgView.image = [UIImage imageNamed:@"头像"];
    
    [infoButton addSubview:imgView];
    [infoButton addSubview:nameLabel];
    [infoButton addSubview:baseBtn];
    [infoButton addSubview:lineView];
//    imgView.backgroundColor = [UIColor yellowColor];
    
    
    return infoButton;
}


+ (InfoButton *)setUpLoginInfon {

    InfoButton *infoButton = [[InfoButton alloc] init];

    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, 60, 60)];
    UILabel *loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 60, 24)];
    InfoButton *loginBtn = [[InfoButton alloc] initWithFrame:CGRectMake(50, 130, 50, 24)];
    InfoButton *registerBtn = [[InfoButton alloc] initWithFrame:CGRectMake(70, 130, 50, 24)];
    [infoButton addSubview:iconView];
    [infoButton addSubview:loginLabel];
    [infoButton addSubview:loginBtn];
    [infoButton addSubview:loginBtn];
    [infoButton addSubview:registerBtn];
    
    return infoButton;
}



- (void)layoutSubviews {

    [super layoutSubviews];
    
}

@end
