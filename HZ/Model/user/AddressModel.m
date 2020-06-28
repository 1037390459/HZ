//
//  AddressModel.m
//  HZ
//
//  Created by million on 2020/6/26.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "AddressModel.h"

@implementation AddressModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"idField" : @"id",
             @"defaultField" : @"default"
    };
}

@end
