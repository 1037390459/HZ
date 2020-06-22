//
//  ETSmsSheetView.h
//  SmartTrack
//
//  Created by 陈明 on 2018/1/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MLPickerView : UIView

typedef void(^OnCancel)(void);
typedef void(^OnSure)(void);

@property (copy, nonatomic) OnCancel onCancel;
@property (copy, nonatomic) OnSure onSure;
@property (strong, nonatomic) NSArray *selectedIndexPaths;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *maxValue;
@property (strong, nonatomic) NSString *minValue;

- (instancetype)initWithFrame:(CGRect)frame Data:(NSArray *)data;

@end
