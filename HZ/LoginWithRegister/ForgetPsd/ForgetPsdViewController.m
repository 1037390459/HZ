//
//  ForgetPsdViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/18.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "ForgetPsdViewController.h"
#import "ForgetPsd2ViewController.h"

@interface ForgetPsdViewController (){
    // 输入手机号
    QMUITextField * phoneTextFiled;
    // 注册按钮
    QMUIButton * okButton;
}

@end

@implementation ForgetPsdViewController

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    self.title = @"重置密码";
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
    // 手机号码
    phoneTextFiled = [[QMUITextField alloc]initWithFrame:CGRectMake(20, NavigationContentTop + 40, SCREEN_WIDTH - 40, 50)];
    phoneTextFiled.placeholder = @"请输入手机号码或邮箱号码";
    phoneTextFiled.textColor = [UIColor whiteColor];
    // 设置textFiled文字起始位子
    // 这种方法改变不了提示文字的起始位子
    //[phoneTextFiled setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    [SingleHelper setTextFiledStartPoint:phoneTextFiled andLength:10];
    [SingleHelper addBordToView:phoneTextFiled andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    [self.view addSubview:phoneTextFiled];
    // 登入按钮
    okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(phoneTextFiled.frame) + 50, SCREEN_WIDTH - 80, 50)];
    okButton.titleLabel.textColor = [UIColor whiteColor];
    [okButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColorMake(69, 70, 80)];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [okButton addTarget:self action:@selector(getVerfiCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}

/**
 获取验证码
 */
- (void)getVerfiCode{
    if ([phoneTextFiled.text isEqualToString:@""]) {
        [QMUITips showError:@"请您输入需要注册手机号或邮箱"];
        return;
    }
    NSLog(@"getVerfiCode api");
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
       NSDictionary *parameters = @{@"email_phone":phoneTextFiled.text};
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/login/code",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
           ForgetPsd2ViewController * psd2Vc = [[ForgetPsd2ViewController alloc]init];
           psd2Vc.accountStr = self->phoneTextFiled.text;
           psd2Vc.naviTitle = @"重置密码";
           psd2Vc.countryId = self.countryId;
           [self.navigationController pushViewController:psd2Vc animated:YES];
       }];
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

@end
