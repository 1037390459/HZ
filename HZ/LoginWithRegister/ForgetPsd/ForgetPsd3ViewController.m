//
//  ForgetPsd3ViewController.m
//  HZ
//
//  Created by million on 2020/6/21.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "ForgetPsd3ViewController.h"
#import "SuccessViewController.h"

@interface ForgetPsd3ViewController (){
    // 提示lab
    QMUILabel * alarmLabel;
    // 验证码输入框
    QMUITextField * pasText1;
    // 重新发送按钮
    QMUITextField * pasText2;
    // 提交按钮
    QMUIButton * okButton;
}

@end

@implementation ForgetPsd3ViewController


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
    // Do any additional setup after loading the view.
}

- (void)creatSubviews{
    // 提示文字
    alarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(20, NavigationContentTop + 40, SCREEN_WIDTH - 40, 50)];
    alarmLabel.numberOfLines = 2;
    alarmLabel.font = UIFontMake(15);
    alarmLabel.textColor = [UIColor whiteColor];
    alarmLabel.text = @"请设置新密码";
    [self.view addSubview:alarmLabel];
    // 密码输入框
    pasText1 = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(alarmLabel.frame) + 20, SCREEN_WIDTH - 40, 50)];
    [SingleHelper setTextFiledStartPoint:pasText1 andLength:10];
    [SingleHelper addBordToView:pasText1 andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    pasText1.placeholder = @"请输入新密码";
    pasText1.textColor = [UIColor whiteColor];
    [self.view addSubview:pasText1];
    // 密码输入框2
    pasText2 = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(pasText1.frame) + 30, SCREEN_WIDTH - 40, 50)];
    [SingleHelper setTextFiledStartPoint:pasText2 andLength:10];
    [SingleHelper addBordToView:pasText2 andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    pasText2.placeholder = @"请确认密码";
    pasText2.textColor = [UIColor whiteColor];
    [self.view addSubview:pasText2];
    // 密码提示lab
    QMUILabel * promptLab = [[QMUILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(pasText2.frame), SCREEN_WIDTH - 50, 30)];
    promptLab.font = UIFontMake(15);
    promptLab.textColor = [UIColor whiteColor];
    promptLab.text = @"密码长度为8~16位,数字、字母、字符至少包含两种";
    [self.view addSubview:alarmLabel];
    // 确认按钮
    okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(pasText2.frame) + 50, SCREEN_WIDTH - 80, 50)];
    okButton.titleLabel.textColor = [UIColor whiteColor];
    [okButton setTitle:@"提   交" forState:UIControlStateNormal];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColorMake(69, 70, 80)];
    [okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [self.view addSubview:okButton];
}

- (void)okButtonClick{
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
          @weakify(self);
       NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
       [parameters setValue:self.accountStr forKey:@"email_phone"];
       [parameters setValue:pasText1.text forKey:@"pwd"];
          [[self class]POST:[NSString stringWithFormat:@"%@/index.php/login/pwd_up",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
              @strongify(self);
              [MBProgressHUD hideHUDForView:self.view animated:false];
              if (error) {
                  [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
                  return;
              }
            UserInfo.sharedSingleton.user = [UserModel mj_objectWithKeyValues:responseObj];
            SuccessViewController * successVC = [[SuccessViewController alloc]init];
            successVC.naviTitle = self.naviTitle;
            [self.navigationController pushViewController:successVC animated:YES];
          }];
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

@end

