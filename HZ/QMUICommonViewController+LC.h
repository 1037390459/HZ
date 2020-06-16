//
//  QMUICommonViewController+LC.h
//  HZ
//
//  Created by 李灿 on 2019/9/18.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUICommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface QMUICommonViewController (LC)
// 设置返回按钮颜色
- (void)setBackItem;
// 设置背景图片
- (void)setBackImage;
// 添加navigationbar 右边的按钮
- (void)creatBarRightBtnWithImageName:(NSString *)imgStr;
- (void)creatBarRightBtnWithTitle:(NSString *)title;
- (void)rightBarBtnClick; // 子类重写
@end

NS_ASSUME_NONNULL_END
