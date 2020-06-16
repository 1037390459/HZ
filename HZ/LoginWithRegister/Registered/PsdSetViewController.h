//
//  PsdSetViewController.h
//  HZ
//
//  Created by 李灿 on 2019/9/18.
//  Copyright © 2019 李灿. All rights reserved.
//

//#import "QMUICommonViewController.h"
#import "QMUICommonViewController+LC.h"
NS_ASSUME_NONNULL_BEGIN

@interface PsdSetViewController : QMUICommonViewController

@property (nonatomic, copy) NSString * accountStr;

@property (nonatomic, copy) NSString * naviTitle;

@property (nonatomic, copy) NSString * code;

@property(nonatomic, assign)NSInteger countryId;

@end

NS_ASSUME_NONNULL_END
