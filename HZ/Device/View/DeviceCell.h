//
//  DeviceCell.h
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUITableViewCell.h"
#import "DeviceCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DeviceCell : QMUITableViewCell
// 设备图标
@property (nonatomic, strong) UIImageView * deviceImgView;
// 设备名字
@property (nonatomic, strong) QMUILabel * deviceNameLabel;
// 设备状态
@property (nonatomic, strong) QMUILabel * deviceStatusLabel;

/**
 根据模型填充数据

 @param model 设备模型
 */
- (void)setSubviewsWithModel:(DeviceCellModel *)model;

@end

NS_ASSUME_NONNULL_END
