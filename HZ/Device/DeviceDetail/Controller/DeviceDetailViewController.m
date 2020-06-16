//
//  DeviceDetailViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "ProgressView.h"
@interface DeviceDetailViewController (){
    CGFloat progressViewWidth;
    UIImageView * deviceIMGView;
    QMUILabel * cleanTimeLab;
    QMUILabel * cleanAreaLab;
    QMUILabel * cleanLenthLab;
    QMUILabel * consumeLab;
    
    ProgressView * powerView;
    ProgressView * brushView;
    ProgressView * rollerView;
    ProgressView * waterView;
}
@end

@implementation DeviceDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.title = @"智能扫地机";
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    progressViewWidth = (SCREEN_WIDTH - 75)/4;
    [self creatSubviews];
}

- (void)creatSubviews{
    deviceIMGView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NavigationContentTop + 50, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    deviceIMGView.image = UIImageMake(@"ic_guiji");
    [self.view addSubview:deviceIMGView];
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(10, NavigationContentTop + 10, SCREEN_WIDTH - 20, 80)];
    topView.backgroundColor = UIColorMake(62, 64, 69);
    [self.view addSubview:topView];
    
    CGFloat labWidth = (topView.frame.size.width - 5)/4;
    
    cleanTimeLab = [[QMUILabel alloc]initWithFrame:CGRectMake(1, 0, labWidth, 40)];
    cleanTimeLab.textColor = [UIColor whiteColor];
    cleanLenthLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanTimeLab];
    QMUILabel * cleanTime = [[QMUILabel alloc]initWithFrame:CGRectMake(1, CGRectGetMaxY(cleanTimeLab.frame), labWidth, 40)];
    cleanTime.textColor = UIColorMake(109, 111, 117);
    cleanTime.text = @"清扫时间";
    cleanTime.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanTime];
    
    UIView * line1View = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cleanTimeLab.frame) + 1, 5, 1, 70)];
    line1View.backgroundColor = UIColorMake(49, 52, 53);
    [topView addSubview:line1View];
    
    cleanAreaLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line1View.frame) + 1, 0, labWidth, 40)];
    cleanAreaLab.textColor = [UIColor whiteColor];
    cleanAreaLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanAreaLab];
    QMUILabel * cleanArea = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line1View.frame) + 1, CGRectGetMaxY(cleanAreaLab.frame), labWidth, 40)];
    cleanArea.textColor = UIColorMake(109, 111, 117);
    cleanArea.text = @"清扫面积";
    cleanArea.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanArea];
    
    UIView * line2View = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cleanAreaLab.frame) + 1, 5, 1, 70)];
    line2View.backgroundColor = UIColorMake(49, 52, 53);
    [topView addSubview:line2View];
    
    cleanLenthLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line2View.frame) + 1, 0, labWidth, 40)];
    cleanLenthLab.textColor = [UIColor whiteColor];
    cleanLenthLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanLenthLab];
    QMUILabel * cleanLenth = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line2View.frame) + 1, CGRectGetMaxY(cleanLenthLab.frame), labWidth, 40)];
    cleanLenth.textColor = UIColorMake(109, 111, 117);
    cleanLenth.text = @"清扫长度";
    cleanLenth.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanLenth];
    
    UIView * line3View = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cleanLenthLab.frame) + 1, 5, 1, 70)];
    line3View.backgroundColor = UIColorMake(49, 52, 53);
    [topView addSubview:line3View];
    
    consumeLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line3View.frame) + 1, 0, labWidth, 40)];
    consumeLab.textColor = [UIColor whiteColor];
    consumeLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cleanLenthLab];
    QMUILabel * conLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line3View.frame) + 1, CGRectGetMaxY(consumeLab.frame), labWidth, 40)];
    conLab.textColor = UIColorMake(109, 111, 117);
    conLab.text = @"消耗热量";
    conLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:conLab];
    
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(deviceIMGView.frame) - 40, SCREEN_WIDTH - 20, 120)];
    bottomView.backgroundColor = UIColorMake(62, 64, 69);
    [self.view addSubview:bottomView];
    
    powerView = [self creatProgressViewWithFrame:CGRectMake(5, (120 - progressViewWidth)/2, progressViewWidth, progressViewWidth) andTitle:@"电量"];
    [bottomView addSubview:powerView];
    
    brushView = [self creatProgressViewWithFrame:CGRectMake(progressViewWidth + 20, (120 - progressViewWidth)/2, progressViewWidth, progressViewWidth) andTitle:@"毛刷状态"];
    [bottomView addSubview:brushView];
    
    rollerView = [self creatProgressViewWithFrame:CGRectMake(progressViewWidth*2 + 35, (120 - progressViewWidth)/2, progressViewWidth, progressViewWidth) andTitle:@"滚筒状态"];
    [bottomView addSubview:rollerView];
    
    waterView = [self creatProgressViewWithFrame:CGRectMake(progressViewWidth*3 + 50, (120 - progressViewWidth)/2, progressViewWidth, progressViewWidth) andTitle:@"水箱状态"];
    [bottomView addSubview:waterView];
    
    QMUIButton * switchBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(40, SCREEN_HEIGHT - 120, SCREEN_WIDTH - 80, 50)];
    [switchBtn setImage:UIImageMake(@"ic_kaiguan") forState:UIControlStateNormal];
    [SingleHelper addBordToView:switchBtn andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [self.view addSubview:switchBtn];
    
    [SingleHelper addBordToView:topView andColor:UIColor.clearColor andRadius:3 BorderWith:0];
    [SingleHelper addBordToView:bottomView andColor:UIColor.clearColor andRadius:3 BorderWith:0];
}

- (ProgressView *)creatProgressViewWithFrame:(CGRect)frame andTitle:(NSString *)title{
    // CGRectMake(100, 300, width, width)
    ProgressView * progressView = [[ProgressView alloc]initWithFrame:frame andTitle:title];
    [SingleHelper addBordToView:progressView andColor:UIColor.clearColor andRadius:(SCREEN_WIDTH - 75)/8 BorderWith:0];
    [self.view addSubview:progressView];
    CGFloat num = arc4random()%100;
    [progressView setProgress:num/100.0f];
    return progressView;
}

@end
