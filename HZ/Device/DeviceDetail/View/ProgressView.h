//
//  ProgressView.h
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong)UILabel *progressLabel;

@end

NS_ASSUME_NONNULL_END
