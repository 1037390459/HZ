//
//  AddressModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressModel : NSObject

@property (nonatomic, assign) NSInteger addTime;
@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * addressInfo;
@property (nonatomic, assign) NSInteger defaultField;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSString * userUuid;

@end

NS_ASSUME_NONNULL_END
