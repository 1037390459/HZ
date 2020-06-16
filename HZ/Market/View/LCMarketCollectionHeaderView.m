//
//  LCMarketCollectionHeaderView.m
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "LCMarketCollectionHeaderView.h"

@interface LCMarketCollectionHeaderView()<SDCycleScrollViewDelegate>

@end

@implementation LCMarketCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatBannerView];
        [self creatMenuView];
    }
    return self;
}

- (void)creatBannerView{
    NSArray * imageNames = @[@"bjaa",@"bjaa",@"bjaa",@"bjaa"];
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.pageControlBottomOffset = 20;
    _cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    _cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
//    _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self addSubview:_cycleScrollView];
}

- (void)creatMenuView{
    UIView * menuView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_cycleScrollView.frame) - 20, SCREEN_WIDTH - 20, 90)];
    menuView.backgroundColor = UIColorMake(73, 75, 81);
    [self addSubview:menuView];
    
    QMUIButton * boutiqueBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(20, 10, 50, 70)];
    boutiqueBtn.imagePosition = QMUIButtonImagePositionTop;
    boutiqueBtn.spacingBetweenImageAndTitle = 5;
    [boutiqueBtn setImage:UIImageMake(@"ic_jingpinqu") forState:UIControlStateNormal];
    [boutiqueBtn setTitle:@"精品区" forState:UIControlStateNormal];
    [boutiqueBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    boutiqueBtn.titleLabel.font = UIFontMake(16);
    [menuView addSubview:boutiqueBtn];
    
    QMUIButton * nursingBtn = [[QMUIButton alloc]initWithFrame:CGRectMake((menuView.frame.size.width - 50)/2, 10, 50, 70)];
    nursingBtn.imagePosition = QMUIButtonImagePositionTop;
    nursingBtn.spacingBetweenImageAndTitle = 5;
    [nursingBtn setImage:UIImageMake(@"ic_huliqu") forState:UIControlStateNormal];
    [nursingBtn setTitle:@"护理区" forState:UIControlStateNormal];
    [nursingBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    nursingBtn.titleLabel.font = UIFontMake(16);
    [menuView addSubview:nursingBtn];
    
    QMUIButton * exchangeBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(menuView.frame.size.width - 70, 10, 50, 70)];
    exchangeBtn.imagePosition = QMUIButtonImagePositionTop;
    exchangeBtn.spacingBetweenImageAndTitle = 5;
    [exchangeBtn setImage:UIImageMake(@"ic_duijiangqu") forState:UIControlStateNormal];
    [exchangeBtn setTitle:@"兑奖区" forState:UIControlStateNormal];
    [exchangeBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    exchangeBtn.titleLabel.font = UIFontMake(16);
    [menuView addSubview:exchangeBtn];
    
    [SingleHelper addBordToView:menuView andColor:UIColor.clearColor andRadius:3 BorderWith:0];
}

@end
