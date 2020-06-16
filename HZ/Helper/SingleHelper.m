//
//  SingleHelper.m
//  library
//
//  Created by baiheng on 2019/5/6.
//  Copyright © 2019 BH. All rights reserved.
//

#import "SingleHelper.h"
#import "Masonry.h"
#import "SDWebImageManager.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SingleHelper

/* 自动布局等间隔UI控件
 * parameters:
 * mainView ： 父控件
 * subviewArray ： 子控件数组
 * mainViewWidth ： 父控件宽度
 * subViewWidth : 子控件宽度
 * subViewHeight : 子控件高度
 * topOffSet : 到顶部的距离
 */
+ (void)autoSetUIFrameWithMainView:(UIView *)mainView andSubViews:(NSArray <UIView *>*)subviewArray andMainWidth:(float )mainViewWidth andSubWidth:(float )subViewWidth andSubHeight:(float )subViewHeight andTopOffSet:(float ) topOffSet{
    int i = 0;
    for (UIView * view in subviewArray) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(subViewWidth);
            make.height.mas_offset(subViewHeight);
            make.left.equalTo(mainView).offset((mainViewWidth - (subviewArray.count * subViewWidth))/(subviewArray.count + 1) * (i + 1) + (i * subViewWidth));
            make.top.equalTo(mainView).offset(topOffSet);
        }];
        i ++;
    }
}

/**
 截取URL中的参数
 
 @param urlStr URL
 @return 字典形式的参数
 */
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr
{
    // 查找参数
    NSRange range = [urlStr rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [urlStr substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}

//将图形转化成圆形
+(void)changeViewToCircle:(UIView *)view
{
    [view.layer setCornerRadius:CGRectGetHeight(view.bounds)/2];
    view.layer.masksToBounds=YES;
}

//视图添加边框
+(void)addBordToView:(UIView *)view andColor:(UIColor *)color andRadius:(int)radius BorderWith:(CGFloat)width
{
    [view.layer setBorderWidth:width];
    view.layer.borderColor=[color CGColor];
    view.layer.cornerRadius=radius;
    view.layer.masksToBounds=YES;
}

//给视图添加点击手势
+(void)addTapImage:(UIView *)view addGesture:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    view.userInteractionEnabled=YES;
    [view addGestureRecognizer:tap];
}

//计算文本的高度
+ (float)getStringHeight:(NSString *)text andFont:(float)font andWidth:(float)width{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height+1;
}

// 底部灰色线条
+(void)setFoursides:(UIView *)view Direction:(NSString *)dirction sizeW:(CGFloat)sizew{
    
    if ([dirction  isEqual: @"left"]) {
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 2, 0.5, sizew-2)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"right"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width - 0.5, 0, 0.5, sizew)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"top"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"bottom"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - 0.5, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
    }
}

/*
 
 *此方法实用性很强，可以得到动态预编译字符串宽高。
 
 */


+ (CGFloat)calculateRowWidth:(NSString *)string andFont:(CGFloat)font {
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};  //指定字号
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    
    return rect.size.width;
}

///MD5加密
+ (NSString *)MD5Str:(NSString *)inputString{
    const char *cStr = [inputString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0], result[1], result[2], result[3],result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]];
    
}

/**
 创建一个button
 
 @param type 范围（0~3）0：左图右字  1：上图下字  2：左字右图  3：上字下图
 @param frame 传入Button的frame
 @return UIButton
 */
+ (UIButton *)creatLCButtonWithStyle:(NSInteger)type andFrame:(CGRect)frame{
    UIButton * btn = [[UIButton alloc]initWithFrame:frame];
    CGFloat gap = 10.f;
    CGFloat labelWidth = btn.titleLabel.bounds.size.width;
    CGFloat imageWidth = btn.imageView.bounds.size.width;
    CGFloat imageHeight = btn.imageView.bounds.size.height;
    CGFloat labelHeight = btn.titleLabel.bounds.size.height;
    
    CGFloat imageOffSetX = labelWidth / 2;
    CGFloat imageOffSetY = imageHeight / 2 + gap / 2;
    CGFloat labelOffSetX = imageWidth / 2;
    CGFloat labelOffSetY = labelHeight / 2 + gap / 2;
    
    // 让UIButton能保证边缘自适应 居中的时候需要
    // 当上下排布的时候，要根据edge来填充content大小
    CGFloat maxWidth = MAX(imageWidth,labelWidth); // 上下排布宽度肯定变小 获取最大宽度的那个
    CGFloat changeWidth = imageWidth + labelWidth - maxWidth; // 横向缩小的总宽度
    CGFloat maxHeight = MAX(imageHeight,labelHeight); // 获取最大高度那个 （就是水平默认排布的时候的原始高度）
    CGFloat changeHeight = imageHeight + labelHeight + gap - maxHeight; // 总高度减去原始高度就是纵向宽大宗高度
    
    switch (type) {
        case 0:
        {
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -gap / 2, 0, gap / 2);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0 , - gap / 2);
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
        }
            break;
        case 1:
        {
            
            btn.imageEdgeInsets = UIEdgeInsetsMake(-imageOffSetY, imageOffSetX, imageOffSetY, -imageOffSetX);
            btn.titleEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -labelOffSetX, -labelOffSetY, labelOffSetX);
            btn.contentEdgeInsets = UIEdgeInsetsMake(changeHeight - labelOffSetY, - changeWidth / 2, labelOffSetY, -changeWidth / 2);
        }
            break;
        case 2:
        {

            btn.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth + gap / 2 , 0, -labelWidth - gap / 2);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - gap / 2, 0, imageWidth+gap / 2);
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, gap / 2, 0, gap / 2);
        }
            break;
        case 3:
        {

            btn.imageEdgeInsets = UIEdgeInsetsMake(imageOffSetY, imageOffSetX, -imageOffSetY, -imageOffSetX);
            btn.titleEdgeInsets = UIEdgeInsetsMake(-labelOffSetY, -labelOffSetX, labelOffSetY, labelOffSetX);
            btn.contentEdgeInsets = UIEdgeInsetsMake(labelOffSetY, -changeWidth / 2, changeHeight - labelOffSetY, -changeWidth / 2);
        }
            break;
        default:
            break;
    }
    return btn;
}

/**
 设置textField的起始位子
 
 @param textField 要设置的textField
 @param width 距离
 */
+ (void)setTextFiledStartPoint:(UITextField *)textField andLength:(CGFloat)width{
    CGRect frame = textField.frame;
    frame.size.width = 8;// 距离左侧的距离
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftView = leftview;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

/**
 把textFiled的提示文字放到中间

 @param textFiled 需要设置的输入框
 @param font 字体大小
 @param color 字体颜色
 @param placeholder 提示的文字
 */
+ (void)setPlaceholderToCenterView:(UITextField *)textFiled andFont:(UIFont *)font andColor:(UIColor *)color andPlaceholder:(NSString *)placeholder{
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    style.alignment = NSTextAlignmentCenter;
    NSAttributedString * attri = [[NSAttributedString alloc]initWithString:placeholder attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font,NSParagraphStyleAttributeName:style}];
    textFiled.attributedPlaceholder = attri;
}

/**
 根据颜色画一张图片

 @param color 图片的颜色
 @return 返回的图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 设置标题的字体和颜色

 @param font 字体大小
 @param color 颜色
 @return 返回的attributes
 */
+ (NSDictionary *)getAttributesWithFont:(UIFont *)font andColor:(UIColor *)color{
    NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
    return attributes;
}

/**
 设置tabbar

 @param title 标题
 @param image 图片
 @param selectedImage 选中时的图片
 @param tag tag值
 @return 返回BarItem
 */
+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectedImage tag:(NSInteger)tag{
    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image tag:tag];
    tabBarItem.selectedImage = selectedImage;
    return tabBarItem;
}

@end
