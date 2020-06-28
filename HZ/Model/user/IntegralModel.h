//
//  IntegralModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntegralModel : NSObject

@property (nonatomic, assign) NSInteger addTime;
@property (nonatomic, strong) NSString * centons;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger integral;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) NSString * userId;

@end

NS_ASSUME_NONNULL_END
