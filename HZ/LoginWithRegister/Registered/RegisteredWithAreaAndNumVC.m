//
//  RegisteredWithAreaAndNumVC.m
//  HZ
//
//  Created by 李灿 on 2019/9/18.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "RegisteredWithAreaAndNumVC.h"
#import "AreaSelectViewController.h"
#import "VerfiViewController.h"
@interface RegisteredWithAreaAndNumVC () <UITextFieldDelegate>{
    // 选择地区
    QMUITextField * areaTextFiled;
    // 当前地区
    QMUIButton * areaButton;
    // 输入手机号
    QMUITextField * phoneTextFiled;
    // 注册按钮
    QMUIButton * regButton;
}

@end

@implementation RegisteredWithAreaAndNumVC

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    self.title = @"注册账号";
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self setBackItem];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
}

- (void)creatSubviews{
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    // 地区
    areaTextFiled = [[QMUITextField alloc]initWithFrame:CGRectMake(20, NavigationContentTop + 20, SCREEN_WIDTH - 40, 50)];
    areaTextFiled.tag = 10001;
    areaTextFiled.delegate = self;
    [SingleHelper addBordToView:areaTextFiled andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    areaTextFiled.text = @"地区";
    areaTextFiled.textColor = [UIColor whiteColor];
    areaButton = [[QMUIButton alloc]initWithFrame:CGRectMake(areaTextFiled.frame.size.width - 110, 0, 100, 50)];
    areaButton.imagePosition = QMUIButtonImagePositionRight;
    areaButton.spacingBetweenImageAndTitle = 5;
    [areaButton addTarget:self action:@selector(selectArea) forControlEvents:UIControlEventTouchUpInside];
    [areaButton setImage:UIImageMake(@"cell_ClickEnable") forState:UIControlStateNormal];
    [areaButton setTitle:@"中国" forState:UIControlStateNormal];
    [areaButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    areaButton.titleLabel.font = UIFontMake(16);
    areaTextFiled.rightView = areaButton;
    areaTextFiled.rightViewMode = UITextFieldViewModeAlways;
    // 设置textFiled文字起始位子
    // 这种方法改变不了提示文字的起始位子
    // [areaTextFiled setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    [SingleHelper setTextFiledStartPoint:areaTextFiled andLength:10];
    [self.view addSubview:areaTextFiled];
    // 手机号码
    phoneTextFiled = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(areaTextFiled.frame) + 30, SCREEN_WIDTH - 40, 50)];
    phoneTextFiled.placeholder = @"请输入手机号码或邮箱号码";
    phoneTextFiled.textColor = [UIColor whiteColor];
    // 设置textFiled文字起始位子
    // 这种方法改变不了提示文字的起始位子
    //[phoneTextFiled setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    [SingleHelper setTextFiledStartPoint:phoneTextFiled andLength:10];
    [SingleHelper addBordToView:phoneTextFiled andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    [self.view addSubview:phoneTextFiled];
    // 登入按钮
    regButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(phoneTextFiled.frame) + 50, SCREEN_WIDTH - 80, 50)];
    regButton.titleLabel.textColor = [UIColor whiteColor];
    [regButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [regButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [regButton setBackgroundColor:UIColorMake(69, 70, 80)];
    [SingleHelper addBordToView:regButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [regButton addTarget:self action:@selector(getVerfiCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regButton];
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

/**
 选择地区
 */
- (void)selectArea{
    AreaSelectViewController * areaSelectVC = [[AreaSelectViewController alloc]init];
    [self.navigationController pushViewController:areaSelectVC animated:YES];
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
              VerfiViewController * verfiVC = [[VerfiViewController alloc]init];
                 verfiVC.accountStr = self->phoneTextFiled.text;
                 verfiVC.naviTitle = @"注册账号";
                 verfiVC.countryId = self.countryId;
                 [self.navigationController pushViewController:verfiVC animated:YES];
          }];
}

#pragma mark ----------- UITextFiledDelegate ---------------
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == 10001) {
        return NO;
    }
    return YES;
}

@end
