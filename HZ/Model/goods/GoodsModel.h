//
//  GoodsModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsModel : NSObject

@property (nonatomic, strong) NSString * goodsImage;
@property (nonatomic, strong) NSString * goodsImg;
@property (nonatomic, strong) NSString * goodsIntroduction;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) NSString * uuid;

@end

NS_ASSUME_NONNULL_END
