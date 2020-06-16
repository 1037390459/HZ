//
//  AddDeviceViewController.h
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUICommonViewController+LC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddDeviceViewController : QMUICommonViewController

@property(nonatomic, copy) void(^doneBlock)(void);

@end

NS_ASSUME_NONNULL_END
