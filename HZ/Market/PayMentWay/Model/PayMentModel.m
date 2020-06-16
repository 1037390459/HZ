//
//  PayMentModel.m
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "PayMentModel.h"

@implementation PayMentModel


- (instancetype)initWithIsSelect:(BOOL)isSelect andImageStr:(NSString *)imageStr andTitleStr:(NSString *)titleStr{
    self = [super init];
    if (self) {
        _isSelect = isSelect;
        _imageStr = imageStr;
        _titleStr = titleStr;
    }
    return self;
}

@end
