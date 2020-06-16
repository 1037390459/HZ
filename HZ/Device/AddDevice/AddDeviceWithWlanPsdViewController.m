//
//  AddDeviceWithWlanPsdViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "AddDeviceWithWlanPsdViewController.h"
#import "AddDeviceSuccessController.h"
@interface AddDeviceWithWlanPsdViewController (){
    QMUITextField * wlanPsdText;
}

@end

@implementation AddDeviceWithWlanPsdViewController

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"输入WiFi密码";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
}

- (void)creatSubviews{
    // 图片
    UIImageView * deviceIMGView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 120)/2, NavigationContentTop + 30, 120, 120)];
    deviceIMGView.image = UIImageMake(@"ic_shebei");
    [self.view addSubview:deviceIMGView];
    // wifi名字
    QMUILabel * wlanNameLab = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(deviceIMGView.frame) + 40, 100, 30)];
    wlanNameLab.textColor = [UIColor whiteColor];
    wlanNameLab.text = @"WiFi名称:";
    [self.view addSubview:wlanNameLab];
    QMUILabel * wlanNameLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(wlanNameLab.frame) + 10, CGRectGetMaxY(deviceIMGView.frame) + 40, (SCREEN_WIDTH - 40) - 110, 30)];
    wlanNameLabel.textColor = [UIColor whiteColor];
    wlanNameLabel.text = @"XXXXXXXX";
    [self.view addSubview:wlanNameLabel];
    // wifi密码
    QMUILabel * wlanPsdLab = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(wlanNameLab.frame) + 10, 100, 30)];
    wlanPsdLab.textColor = [UIColor whiteColor];
    wlanPsdLab.text = @"WiFi密码:";
    [self.view addSubview:wlanPsdLab];
    wlanPsdText = [[QMUITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(wlanPsdLab.frame) + 10, CGRectGetMaxY(wlanNameLab.frame) + 10, (SCREEN_WIDTH - 40) - 110, 30)];
    wlanPsdText.placeholder = @"请输入对应WiFi的密码";
    wlanPsdText.backgroundColor = UIColorMake(83, 85, 91);
    [SingleHelper addBordToView:wlanPsdText andColor:UIColor.clearColor andRadius:5 BorderWith:0];
    [self.view addSubview:wlanPsdText];
    // 显示隐藏密码按钮
    QMUIButton * hidePsdBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(wlanPsdText.frame.size.width - 30, 5, 20, 20)];
    [hidePsdBtn setImage:UIImageMake(@"ic_yanjinga") forState:UIControlStateNormal];
    [hidePsdBtn addTarget:self action:@selector(hideOrShowPsd) forControlEvents:UIControlEventTouchUpInside];
    wlanPsdText.rightView = hidePsdBtn;
    wlanPsdText.rightViewMode = UITextFieldViewModeAlways;
    
    // 提示
    QMUILabel * alarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(wlanPsdText.frame) + 10, SCREEN_WIDTH - 40, 30)];
    alarmLabel.textColor = [UIColor whiteColor];
    alarmLabel.text = @"请确保WiFi密码正确(不支持5G)";
    [self.view addSubview:alarmLabel];
    
    // 连接
    QMUIButton * okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(alarmLabel.frame) + 40, SCREEN_WIDTH - 80, 50)];
    okButton.titleLabel.textColor = [UIColor whiteColor];
    [okButton setTitle:@"连   接" forState:UIControlStateNormal];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColor.redColor];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [okButton addTarget:self action:@selector(connectWifi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}

- (void)connectWifi{
    AddDeviceSuccessController * addSuccessVC = [[AddDeviceSuccessController alloc]init];
    addSuccessVC.doneBlock = self.doneBlock;
    [self.navigationController pushViewController:addSuccessVC animated:YES];
}

- (void)hideOrShowPsd{
    wlanPsdText.secureTextEntry = !wlanPsdText.isSecureTextEntry;
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

@end
