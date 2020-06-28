//
//  CategoryModel.h
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryModel : NSObject

@property (nonatomic, assign) NSInteger addTime;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) NSString * uuid;

@end

NS_ASSUME_NONNULL_END
