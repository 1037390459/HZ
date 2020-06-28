//
//  OrderModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressModel.h"
#import "GoodsModel.h"
#import "CouponModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject

@property (nonatomic, strong) AddressModel * address;
@property (nonatomic, strong) NSArray<CouponModel *> * couponList;
@property (nonatomic, assign) NSInteger freight;
@property (nonatomic, strong) NSArray<GoodsModel *> * goodsList;
@property (nonatomic, assign) NSInteger priceZ;
@property (nonatomic, assign) NSInteger userIntegral;

@end

@interface CouponList : NSObject



@end

NS_ASSUME_NONNULL_END
