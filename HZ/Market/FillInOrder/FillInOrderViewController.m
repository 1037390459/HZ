//
//  FillInOrderViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "FillInOrderViewController.h"
#import "PayWayViewController.h"
@interface FillInOrderViewController ()

@end

@implementation FillInOrderViewController

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.title = @"填写订单";
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self creatBarRightBtnWithTitle:@"保存"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
    // Do any additional setup after loading the view.
}

- (void)rightBarBtnClick{
    NSLog(@"保存");
}

- (void)creatSubviews{
    UIScrollView * mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavigationContentTop, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationContentTop - 60)];
    [self.view addSubview:mainScrollView];
    // 选择地址
    UIView * locationView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 105)];
    locationView.backgroundColor = UIColorMake(64, 65, 72);
    [mainScrollView addSubview:locationView];
    
    QMUILabel * recipientLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, 10, (SCREEN_WIDTH - 30)/2, 30)];
    recipientLab.textColor = UIColor.whiteColor;
    recipientLab.font = UIFontMake(15);
    [locationView addSubview:recipientLab];
    
    QMUILabel * phoneLab = [[QMUILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 30)/2 + 5, 10, (SCREEN_WIDTH - 30)/2 - 30, 30)];
    phoneLab.textColor = UIColor.whiteColor;
    phoneLab.font = UIFontMake(13);
    phoneLab.textAlignment = NSTextAlignmentRight;
    [locationView addSubview:phoneLab];
    
    QMUILabel * addressAlarmLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(phoneLab.frame) + 5, 100, 30)];
    addressAlarmLab.text = @"收货地址:";
    addressAlarmLab.textColor = UIColor.whiteColor;
    [locationView addSubview:addressAlarmLab];
    
    QMUILabel * addressLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressAlarmLab.frame) + 5, CGRectGetMaxY(phoneLab.frame) + 5, locationView.frame.size.width - CGRectGetMaxX(addressAlarmLab.frame) - 20 - 5 - 30, 50)];
    addressLab.numberOfLines = 0;
    addressLab.textColor = UIColor.whiteColor;
    [locationView addSubview:addressLab];
    
    UIImageView * cellImg = [[UIImageView alloc]initWithFrame:CGRectMake(locationView.frame.size.width - 30, (105 - 30)/2, 20, 30)];
    cellImg.image = UIImageMake(@"ic_you");
    [locationView addSubview:cellImg];
    
    // 活动section
    UIView * actionView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(locationView.frame) + 20 , SCREEN_WIDTH - 20, 100)];
    actionView.backgroundColor = UIColorMake(64, 65, 72);
    [mainScrollView addSubview:actionView];
    
    UIView * couponView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 49.5)];
    [actionView addSubview:couponView];
    
    QMUIButton * couponBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(5, 10, 30, 30)];
    [SingleHelper addBordToView:couponBtn andColor:UIColor.whiteColor andRadius:15 BorderWith:0.5];
    [couponBtn setImage:UIImageMake(@"check") forState:UIControlStateNormal];
    [couponBtn setImage:UIImageMake(@"checked") forState:UIControlStateSelected];
    [couponView addSubview:couponBtn];
    
    QMUILabel * couponLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(couponBtn.frame) + 5, 10, 100, 30)];
    couponLab.text = @"优惠券:";
    couponLab.textColor = UIColor.whiteColor;
    [couponView addSubview:couponLab];
    
    QMUILabel * selectCouponLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(couponLab.frame) + 5, 10, SCREEN_WIDTH - CGRectGetMaxX(couponLab.frame) - 5 - 130, 30)];
    selectCouponLab.textColor = UIColor.whiteColor;
    [couponView addSubview:selectCouponLab];
    
    QMUILabel * delPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(selectCouponLab.frame) + 5, 10, 60, 30)];
    delPriceLab.textColor = UIColor.whiteColor;
    delPriceLab.text = @"-¥20";
    delPriceLab.textAlignment = NSTextAlignmentRight;
    [couponView addSubview:delPriceLab];
    
    UIImageView * couponCellImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(delPriceLab.frame) + 5, 15, 15, 20)];
    couponCellImg.image = UIImageMake(@"ic_you");
    [couponView addSubview:couponCellImg];
    
    // 分割线
    [actionView addSubview:[self creatHLineWithY:49.5]];
    
    // 积分
    UIView * integralView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(couponView.frame) + 1, SCREEN_WIDTH - 20, 49.5)];
    [actionView addSubview:integralView];
    
    QMUIButton * integralBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(5, 10, 30, 30)];
    [SingleHelper addBordToView:integralBtn andColor:UIColor.whiteColor andRadius:15 BorderWith:0.5];
    [integralBtn setImage:UIImageMake(@"check") forState:UIControlStateNormal];
    [integralBtn setImage:UIImageMake(@"checked") forState:UIControlStateSelected];
    [integralView addSubview:integralBtn];
    
    QMUILabel * integralDelNumLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(integralBtn.frame) + 5, 10, SCREEN_WIDTH - 20 - CGRectGetMaxX(integralBtn.frame) - 5 - 130, 30)];
    integralDelNumLab.textColor = UIColor.whiteColor;
    [integralView addSubview:integralDelNumLab];
    
    QMUILabel * IntegraDelPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(selectCouponLab.frame) + 5, 10, 60, 30)];
    IntegraDelPriceLab.textColor = UIColor.whiteColor;
    IntegraDelPriceLab.text = @"-¥20";
    IntegraDelPriceLab.textAlignment = NSTextAlignmentRight;
    [integralView addSubview:IntegraDelPriceLab];
    
    UIImageView * integraCellImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(delPriceLab.frame) + 5, 15, 15, 20)];
    integraCellImg.image = UIImageMake(@"ic_you");
    [integralView addSubview:integraCellImg];
    
    // 价钱详情
    UIView * priceDetailView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(actionView.frame) + 20, SCREEN_WIDTH - 20, 124)];
    priceDetailView.backgroundColor = UIColorMake(64, 65, 72);
    [mainScrollView addSubview:priceDetailView];
    
    // allPrice
    QMUILabel * goodsAllPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, 0, 120, 30)];
    goodsAllPriceLab.textColor = UIColor.whiteColor;
    goodsAllPriceLab.text = @"商品合计";
    [priceDetailView addSubview:goodsAllPriceLab];
    
    QMUILabel * allPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 0, 100, 30)];
    allPriceLab.textColor = UIColor.whiteColor;
    allPriceLab.text = @"¥2000";
    allPriceLab.textAlignment = NSTextAlignmentRight;
    [priceDetailView addSubview:allPriceLab];
    
    // 分割线
    [priceDetailView addSubview:[self creatHLineWithY:CGRectGetMaxY(allPriceLab.frame)]];
    
    // FreightPrice
    QMUILabel * freightLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(allPriceLab.frame) + 1, 120, 30)];
    freightLab.textColor = UIColor.whiteColor;
    freightLab.text = @"运费:";
    [priceDetailView addSubview:freightLab];
    
    QMUILabel * freightPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 150, CGRectGetMaxY(allPriceLab.frame) + 1, 100, 30)];
    freightPriceLab.textColor = UIColor.whiteColor;
    freightPriceLab.text = @"¥2000";
    freightPriceLab.textAlignment = NSTextAlignmentRight;
    [priceDetailView addSubview:freightPriceLab];
    
    // 分割线
    [priceDetailView addSubview:[self creatHLineWithY:CGRectGetMaxY(freightPriceLab.frame)]];
    
    // OfferPrice
    QMUILabel * offerLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(freightPriceLab.frame) + 1, 120, 30)];
    offerLab.textColor = UIColor.whiteColor;
    offerLab.text = @"优惠:";
    [priceDetailView addSubview:offerLab];
    
    QMUILabel * offerPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 150, CGRectGetMaxY(freightPriceLab.frame) + 1, 100, 30)];
    offerPriceLab.textColor = UIColor.whiteColor;
    offerPriceLab.text = @"¥2000";
    offerPriceLab.textAlignment = NSTextAlignmentRight;
    [priceDetailView addSubview:offerPriceLab];
    
    // 分割线
    [priceDetailView addSubview:[self creatHLineWithY:CGRectGetMaxY(offerPriceLab.frame)]];
    
    // ShouldPrice
    QMUILabel * shouldLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(offerPriceLab.frame) + 1, 120, 30)];
    shouldLab.textColor = UIColor.whiteColor;
    shouldLab.text = @"应付金额:";
    [priceDetailView addSubview:shouldLab];
    
    QMUILabel * shouldPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 150, CGRectGetMaxY(offerPriceLab.frame) + 1, 100, 30)];
    shouldPriceLab.textColor = UIColor.whiteColor;
    shouldPriceLab.text = @"¥2000";
    shouldPriceLab.textAlignment = NSTextAlignmentRight;
    [priceDetailView addSubview:shouldPriceLab];

    // 订单详情
    UIView * orderDetailView = [[UIView alloc]initWithFrame:CGRectMake(10 , CGRectGetMaxY(priceDetailView.frame) + 20, SCREEN_WIDTH - 20, 100)];
    orderDetailView.backgroundColor = UIColorMake(64, 65, 72);
    [mainScrollView addSubview:orderDetailView];
    
    // 商品图片
    UIImageView * goodImgView = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, 96, 96)];
    goodImgView.image = UIImageMake(@"bjb");
    [orderDetailView addSubview:goodImgView];
    
    // 商品描述
    QMUILabel * goodDetailLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(goodImgView.frame) + 5, 2, orderDetailView.frame.size.width - 100 - 5 , (100 - 4)/2 + 20)];
    goodDetailLab.numberOfLines = 0;
    goodDetailLab.textColor = UIColor.whiteColor;
    goodDetailLab.text = @"氨基酸肯德基拉科技拉进来的加了倒垃圾对啦来得及案例打了卡打了卡吉林大街阿拉丁捡垃圾对啦";
    [orderDetailView addSubview:goodDetailLab];
    
    // 商品价格和数量
    QMUILabel * priLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(goodImgView.frame) + 5, CGRectGetMaxY(goodImgView.frame) - 30, CGRectGetWidth(goodDetailLab.frame) - 40, 30)];
    priLab.textColor = UIColor.whiteColor;
    priLab.text = @"¥12893810.00";
    [orderDetailView addSubview:priLab];
    
    QMUILabel * countLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(priLab.frame) + 5, CGRectGetMaxY(goodImgView.frame) - 30, 40, 30)];
    countLab.textColor = UIColor.whiteColor;
    countLab.text = @"X2";
    [orderDetailView addSubview:countLab];

    mainScrollView.contentSize = CGSizeMake(1, CGRectGetMaxY(orderDetailView.frame) + 20);
    
    // toolBar
    UIView * orderTool = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    orderTool.backgroundColor = UIColorMake(64, 65, 72);
    [self.view addSubview:orderTool];
    
    QMUILabel * payLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, 15, 80, 30)];
    payLab.textColor = UIColor.whiteColor;
    payLab.text = @"应付";
    [orderTool addSubview:payLab];
    
    QMUILabel * payPriceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(payLab.frame) + 5, 15, 140, 30)];
    payPriceLab.textColor = UIColor.whiteColor;
    payPriceLab.text = @"¥23131.00";
    [orderTool addSubview:payPriceLab];
    
    QMUIButton * payNowButton = [[QMUIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 110, 0, 110, 60)];
    payNowButton.backgroundColor = UIColor.redColor;
    [payNowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payNowButton setTitle:@"去付款" forState:UIControlStateNormal];
    [payNowButton addTarget:self action:@selector(payNow) forControlEvents:UIControlEventTouchUpInside];
    [orderTool addSubview:payNowButton];
}

- (void)payNow{
    PayWayViewController * payVC = [[PayWayViewController alloc]init];
    [self.navigationController pushViewController:payVC animated:YES];
}

- (UIView *)creatHLineWithY:(CGFloat)y{
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(10, y, SCREEN_WIDTH - 40, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    return lineView;
}

@end
