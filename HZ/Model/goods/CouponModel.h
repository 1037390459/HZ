//
//  CouponModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CouponModel : NSObject

@property (nonatomic, strong) NSString * centons;
@property (nonatomic, assign) NSInteger endTime;
@property (nonatomic, strong) NSString * goodsId;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * priceZ;
@property (nonatomic, assign) NSInteger startTime;
@property (nonatomic, assign) NSInteger stateType;
@property (nonatomic, strong) NSString * uuid;

@end

NS_ASSUME_NONNULL_END
