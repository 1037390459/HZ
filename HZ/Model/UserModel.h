//
//  UserModel.h
//  HZ
//
//  Created by million on 2020/6/15.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, strong) NSString * account;
@property (nonatomic, assign) NSInteger addTime;
@property (nonatomic, strong) NSObject * area;
@property (nonatomic, assign) NSInteger areaId;
@property (nonatomic, assign) NSInteger birthday;
@property (nonatomic, strong) NSString * cardNumber;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger integral;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSString * pwd;
@property (nonatomic, strong) NSObject * sex;
@property (nonatomic, strong) NSObject * token;
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * uuid;
@property (nonatomic, assign) NSInteger weight;

@end

NS_ASSUME_NONNULL_END
