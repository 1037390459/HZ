//
//  AddDeviceViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "AddDeviceViewController.h"
#import "AddDeviceWithWlanPsdViewController.h"

@interface AddDeviceViewController (){
    QMUIButton * agreeButton;
}

@end

@implementation AddDeviceViewController

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"添加设备";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
    // Do any additional setup after loading the view.
}

- (void)creatSubviews{
    UIImageView * deviceIMGView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 120)/2, NavigationContentTop + 30, 120, 120)];
    deviceIMGView.image = UIImageMake(@"ic_shebei");
    [self.view addSubview:deviceIMGView];
    
    QMUILabel * ontTipLab = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(deviceIMGView.frame) + 30, SCREEN_WIDTH - 40, 30)];
    ontTipLab.font = UIFontMake(15);
    ontTipLab.textColor = [UIColor whiteColor];
    ontTipLab.text = @"1、请确保扫地机正常通电。";
    [self.view addSubview:ontTipLab];
    
    QMUILabel * twoTipLab = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(ontTipLab.frame) + 10, SCREEN_WIDTH - 40, 70)];
    twoTipLab.numberOfLines = 3;
    twoTipLab.font = UIFontMake(15);
    twoTipLab.textColor = [UIColor whiteColor];
    twoTipLab.text = @"2、请确保扫地机进入配网模式。（长按设备 reset 键5s，听到“滴”的一声，指示灯快速闪烁。）";
    [self.view addSubview:twoTipLab];
    
    //  请确认上述操作
    agreeButton = [[QMUIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 200)/2, CGRectGetMaxY(twoTipLab.frame) + 42.f, 25, 25)];
    [SingleHelper addBordToView:agreeButton andColor:UIColor.whiteColor andRadius:12.5 BorderWith:1];
    [agreeButton setBackgroundImage:UIImageMake(@"check") forState:UIControlStateNormal];
    [agreeButton setBackgroundImage:UIImageMake(@"checked") forState:UIControlStateSelected];
    [agreeButton addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeButton];
    
    QMUILabel * agreeLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(agreeButton.frame) + 10, CGRectGetMaxY(twoTipLab.frame) + 40, 170, 30)];
    agreeLabel.text = @"已确认上述操作";
    agreeLabel.textAlignment = NSTextAlignmentCenter;
    agreeLabel.font = UIFontMake(15);
    agreeLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:agreeLabel];
    
    QMUIButton * okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(agreeLabel.frame) + 20, SCREEN_WIDTH - 80, 50)];
    okButton.titleLabel.textColor = [UIColor whiteColor];
    [okButton setTitle:@"确   定" forState:UIControlStateNormal];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColor.redColor];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}

- (void)agreeBtnClick:(QMUIButton *)sender{
    sender.selected = !sender.isSelected;
}

- (void)okButtonClick{
    AddDeviceWithWlanPsdViewController * addWithPsd = [[AddDeviceWithWlanPsdViewController alloc]init];
    addWithPsd.doneBlock = self.doneBlock;
    [self.navigationController pushViewController:addWithPsd animated:YES];
}

@end
