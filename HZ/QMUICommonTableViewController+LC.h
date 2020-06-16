//
//  QMUICommonTableViewController+LC.h
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUICommonTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface QMUICommonTableViewController (LC)
// 设置返回按钮颜色
- (void)setBackItem;
// 设置背景图片
- (void)setBackImage;
// 添加navigationbar 右边的按钮
- (void)creatBarRightBtnWithImageName:(NSString *)imgStr;
- (void)rightBarBtnClick; // 子类重写
@end

NS_ASSUME_NONNULL_END
