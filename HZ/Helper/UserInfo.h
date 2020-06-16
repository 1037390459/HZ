//
//  UserInfo.h
//  HZ
//
//  Created by million on 2020/6/15.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

+ (instancetype)sharedSingleton;

@property(nonatomic, strong) UserModel *user;

@end

NS_ASSUME_NONNULL_END
