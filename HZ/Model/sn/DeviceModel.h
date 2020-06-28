//
//  DeviceCellModel.h
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceModel : NSObject

@property (nonatomic, strong) NSString * addTime;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * productMac;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * uuid;

@end

NS_ASSUME_NONNULL_END
