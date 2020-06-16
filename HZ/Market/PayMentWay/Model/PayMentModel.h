//
//  PayMentModel.h
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayMentModel : NSObject

@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) NSString * imageStr;
@property (nonatomic, copy) NSString * titleStr;

- (instancetype)initWithIsSelect:(BOOL)isSelect andImageStr:(NSString *)imageStr andTitleStr:(NSString *)titleStr;

@end

NS_ASSUME_NONNULL_END
