//
//  MarketCollectionViewCell.m
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "MarketCollectionViewCell.h"

@interface MarketCollectionViewCell(){
    UIImageView * goodsImgView;
    QMUILabel * goodsNameLab;
    QMUILabel * goodsPriceLab;
}

@end

@implementation MarketCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubviews];
        self.backgroundColor = UIColorMake(73, 75, 81);
    }
    return self;
}

- (void)creatSubviews{
    goodsImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, (SCREEN_WIDTH - 30)/2 - 10, (SCREEN_WIDTH - 30)/2 - 10)];
    [self addSubview:goodsImgView];
    
    goodsNameLab = [[QMUILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(goodsImgView.frame) + 5, (SCREEN_WIDTH - 30)/2 - 10, 25)];
    goodsNameLab.textColor = [UIColor whiteColor];
    goodsNameLab.font = UIFontMake(14);
    goodsNameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:goodsNameLab];
    
    goodsPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(goodsNameLab.frame) + 5, (SCREEN_WIDTH - 30)/2 - 10, 25)];
    goodsPriceLab.textColor = [UIColor whiteColor];
    goodsPriceLab.font = UIFontMake(14);
    goodsPriceLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:goodsPriceLab];
}

- (void)setSubviewsWithModel:(MarketCellModel *)model{
    goodsImgView.image = UIImageMake(model.goodImgStr);
    goodsNameLab.text = model.goodsName;
    goodsPriceLab.text = model.goodsPrice;
}

@end
