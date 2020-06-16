//
//  UserInfo.m
//  HZ
//
//  Created by million on 2020/6/15.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)sharedSingleton {
    static UserInfo *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

@end
