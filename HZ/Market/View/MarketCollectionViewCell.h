//
//  MarketCollectionViewCell.h
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarketCollectionViewCell : UICollectionViewCell

- (void)setSubviewsWithModel:(MarketCellModel *)model;

@end

NS_ASSUME_NONNULL_END
