//
//  DeviceCell.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "DeviceCell.h"

@implementation DeviceCell

- (instancetype)init{
    self = [super init];
    if (self) {
        [self creatSubviews];
        self.backgroundColor = UIColorMake(73, 75, 82);
    }
    return self;
}

/**
 创建子控件
 */
- (void)creatSubviews{
    [self layoutIfNeeded];
    // 设备图标
    _deviceImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    [self addSubview:_deviceImgView];
    
    // 设备名字
    _deviceNameLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_deviceImgView.frame) + 10, 35, 150, 30)];
    _deviceNameLabel.textColor = [UIColor whiteColor];
    [self addSubview:_deviceNameLabel];
    
    // 设备状态
    _deviceStatusLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 35, 50, 30)];
    _deviceStatusLabel.textColor = [UIColor whiteColor];
    [self addSubview:_deviceStatusLabel];
    
    // 箭头图标
    UIImageView * cellIcon = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20, 35, 15, 30)];
    cellIcon.image = UIImageMake(@"ic_you");
    [self addSubview:cellIcon];
}


/**
 根据模型填充数据
 ic_zhinengsaodiji 在线状态图标
 ic_zhinengsaodijia 离线状态图标
 @param model 设备模型
 */
- (void)setSubviewsWithModel:(DeviceModel *)model{
    int i = arc4random()%2;
    if (i == 1) {
        _deviceImgView.image = UIImageMake(@"ic_zhinengsaodiji");
        _deviceStatusLabel.text = @"在线";
    }else{
        _deviceImgView.image = UIImageMake(@"ic_zhinengsaodijia");
        _deviceStatusLabel.text = @"离线";
    }
    _deviceNameLabel.text = @"扫地机器人";
}

@end
