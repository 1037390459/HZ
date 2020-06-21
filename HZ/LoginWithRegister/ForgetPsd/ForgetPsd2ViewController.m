//
//  ForgetPsd2ViewController.m
//  HZ
//
//  Created by million on 2020/6/21.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "ForgetPsd2ViewController.h"
#import "ForgetPsd3ViewController.h"

@interface ForgetPsd2ViewController (){
    // 提示lab
    QMUILabel * alarmLabel;
    // 验证码输入框
    QMUITextField * verfiText;
    // 重新发送按钮
    QMUIButton * reSendButton;
    // 确定按钮
    QMUIButton * okButton;
}

@end


@implementation ForgetPsd2ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    self.title = _naviTitle;
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self setBackItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
}

- (void)creatSubviews{
    // 警示文字
    QMUILabel * warmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(20, NavigationContentTop + 30,SCREEN_WIDTH - 40, 30)];
    warmLabel.textColor = [UIColor redColor];
    warmLabel.font = UIFontMake(16);
    warmLabel.text = @"为了账号安全,需要验证手机的有效性!";
    if ([_naviTitle isEqualToString:@"重置密码"]) {
        warmLabel.hidden = NO;
    }else{
        warmLabel.hidden = YES;
    }
    [self.view addSubview:warmLabel];
    // 提示文字
    alarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(warmLabel.frame) + 10, SCREEN_WIDTH - 40, 50)];
    alarmLabel.numberOfLines = 2;
    alarmLabel.font = UIFontMake(15);
    alarmLabel.textColor = [UIColor whiteColor];
    alarmLabel.text = [NSString stringWithFormat:@"我们已经向%@发送了验证码,请输入验证码...",_accountStr];
    [self.view addSubview:alarmLabel];
    // 验证码输入框
    verfiText = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(alarmLabel.frame) + 20, (SCREEN_WIDTH - 40)/2, 50)];
    [SingleHelper setTextFiledStartPoint:verfiText andLength:10];
    [SingleHelper addBordToView:verfiText andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    verfiText.placeholder = @"请输入验证码";
    verfiText.textColor = [UIColor whiteColor];
    [self.view addSubview:verfiText];
    // 重新发送
    reSendButton = [[QMUIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(verfiText.frame) + 20, CGRectGetMaxY(alarmLabel.frame) + 20, (SCREEN_WIDTH - 40)/2 - 20, 50)];
    [reSendButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [reSendButton setTitle:@"重新发送" forState:UIControlStateNormal];
    [reSendButton setBackgroundColor:UIColor.redColor];
    [SingleHelper addBordToView:reSendButton andColor:UIColor.clearColor andRadius:25 BorderWith:1];
    [reSendButton addTarget:self action:@selector(resendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reSendButton];
    // 确认按钮
    okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(reSendButton.frame) + 50, SCREEN_WIDTH - 80, 50)];
    okButton.titleLabel.textColor = [UIColor whiteColor];
    [okButton setTitle:@"确   定" forState:UIControlStateNormal];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColorMake(69, 70, 80)];
    [okButton addTarget:self action:@selector(setPassword) forControlEvents:UIControlEventTouchUpInside];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [self.view addSubview:okButton];
}

- (void)resendBtnClick{
    NSLog(@"getVerfiCode api");
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
       NSDictionary *parameters = @{@"email_phone":self.accountStr};
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/login/code",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
          [self custonDown];
       }];
}

- (void)setPassword{
    NSLog(@"verfiCode api");
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:self.accountStr forKey:@"email_phone"];
    [parameters setValue:verfiText.text forKey:@"code"];
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/login/code_correct",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
          ForgetPsd3ViewController * psd3Vc = [[ForgetPsd3ViewController alloc]init];
          psd3Vc.naviTitle = self.naviTitle;
          psd3Vc.accountStr = self.accountStr;
          psd3Vc.code = self->verfiText.text;
          psd3Vc.countryId = self.countryId;
          [self.navigationController pushViewController:psd3Vc animated:YES];
       }];
}

- (void)custonDown{
    [reSendButton setTitle:@"重新发送(60S)" forState:UIControlStateNormal];
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self->reSendButton setTitle:@"重新发送" forState:UIControlStateNormal];
                self->reSendButton.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self->reSendButton setTitle:[NSString stringWithFormat:@"重新发送(%@S)",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                self->reSendButton.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

@end
