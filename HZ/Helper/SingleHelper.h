//
//  SingleHelper.h
//  library
//
//  Created by baiheng on 2019/5/6.
//  Copyright © 2019 BH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleHelper : NSObject
/* 自动布局等间隔UI控件
 * parameters:
 * mainView ： 父控件
 * subviewArray ： 子控件数组
 * mainViewWidth ： 父控件宽度
 * subViewWidth : 子控件宽度
 * subViewHeight : 子控件高度
 * topOffSet : 到顶部的距离
 */
+ (void)autoSetUIFrameWithMainView:(UIView *)mainView andSubViews:(NSArray <UIView *>*)subviewArray andMainWidth:(float )mainViewWidth andSubWidth:(float )subViewWidth andSubHeight:(float )subViewHeight andTopOffSet:(float ) topOffSet;

/**
 截取URL中的参数
 
 @param urlStr URL
 @return 字典形式的参数
 */
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;

//将View转化成圆形
+ (void)changeViewToCircle:(UIView*)view;

//视图添加边框 (切角)
+ (void)addBordToView:(UIView*)view andColor:(UIColor*)color andRadius:(int)radius BorderWith:(CGFloat)width;

//视图添加手势
+ (void)addTapImage:(UIView *)view addGesture:(id)target action:(SEL)action;

//计算文本的高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width;

//控件边缘灰色线条
+ (void)setFoursides:(UIView *)view Direction:(NSString *)dirction sizeW:(CGFloat)sizew;
// 计算字符串宽度
+ (CGFloat)calculateRowWidth:(NSString *)string andFont:(CGFloat)font;
///MD5加密
+ (NSString *)MD5Str:(NSString *)inputString;

/**
 创建一个button

 @param type 范围（0~3）0：左图右字  1：上图下字  2：左字右图  3：上字下图
 @param frame 传入Button的frame
 @return UIButton
 */
+ (UIButton *)creatLCButtonWithStyle:(NSInteger)type andFrame:(CGRect)frame;

/**
 设置textField的起始位子

 @param textField 要设置的textField
 @param width 距离
 */
+ (void)setTextFiledStartPoint:(UITextField *)textField andLength:(CGFloat)width;

/**
 把textFiled的提示文字放到中间
 
 @param textFiled 需要设置的输入框
 @param font 字体大小
 @param color 字体颜色
 @param placeholder 提示的文字
 */
+ (void)setPlaceholderToCenterView:(UITextField *)textFiled andFont:(UIFont *)font andColor:(UIColor *)color andPlaceholder:(NSString *)placeholder;

/**
 根据颜色画一张图片
 
 @param color 图片的颜色
 @return 返回的图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 设置标题的字体和颜色
 
 @param font 字体大小
 @param color 颜色
 @return 返回的attributes
 */
+ (NSDictionary *)getAttributesWithFont:(UIFont *)font andColor:(UIColor *)color;

/**
 设置tabbar
 
 @param title 标题
 @param image 图片
 @param selectedImage 选中时的图片
 @param tag tag值
 @return 返回BarItem
 */
+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectedImage tag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
