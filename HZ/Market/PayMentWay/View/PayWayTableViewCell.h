//
//  PayWayTableViewCell.h
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUITableViewCell.h"
#import "PayMentModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol PayWayTableViewCellDelegate <NSObject>

- (void)selectBtnClick;
- (void)updateTableView;

@end

@interface PayWayTableViewCell : QMUITableViewCell

@property (nonatomic, strong) QMUIButton * selectBtn;
@property (nonatomic, strong) UIImageView * payMentImg;
@property (nonatomic, strong) QMUILabel * payMentTitle;
@property (nonatomic, strong) PayMentModel * model;

@property (weak) id<PayWayTableViewCellDelegate> delegate;


- (void)setSubviewWithModel:(PayMentModel *)model;

@end

NS_ASSUME_NONNULL_END
