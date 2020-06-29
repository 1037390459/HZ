//
//  LoginViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/17.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "LoginViewController.h"
// 选择地区
#import "AreaSelectViewController.h"
// 注册
#import "RegisteredWithAreaAndNumVC.h"
// 找回密码
#import "ForgetPsdViewController.h"
@interface LoginViewController () <UITextFieldDelegate>{
    // 用户头像
    UIImageView * userHeaderIMGView;
    // 选择地区
    QMUITextField * areaTextFiled;
    // 当前地区
    QMUIButton * areaButton;
    // 输入手机号
    QMUITextField * phoneTextFiled;
    // 账号提示
    QMUILabel * phoneAlarmLabel;
    // 输入密码
    QMUITextField * psdTextFiled;
    // 密码提示
    QMUILabel * psdAlarmLabel;
    // 记住密码按钮
    QMUIButton * savePsdButton;
    // 记住密码
    QMUILabel * savePsdLabel;
    // 登入按钮
    QMUIButton * loginButton;
    // 注册账号
    QMUILinkButton * registeredButton;
    // 忘记密码
    QMUILinkButton * forgetPsdButton;
}

@property(nonatomic, assign)NSInteger countryId;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSettings];
    [self setBackImage];
    [self creatSubviews];
    // Do any additional setup after loading the view.
}

- (void)initSettings {
    _countryId = 257;
}

- (void)creatSubviews{
    // 设置颜色
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    // 用户头像
    userHeaderIMGView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 90)/2, NavigationContentTop + 30, 90, 90)];
    userHeaderIMGView.backgroundColor = [UIColor whiteColor];
    [SingleHelper addBordToView:userHeaderIMGView andColor:UIColor.clearColor andRadius:45 BorderWith:0];
    [self.view addSubview:userHeaderIMGView];
    // 地区
    areaTextFiled = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(userHeaderIMGView.frame) + 20, SCREEN_WIDTH - 40, 50)];
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
    // 手机号码错误提示
    phoneAlarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(phoneTextFiled.frame), SCREEN_WIDTH - 60, 30)];
    phoneAlarmLabel.textColor = [UIColor redColor];
    phoneAlarmLabel.text = @"您输入的手机号码不存在,请重新输入...";
    phoneAlarmLabel.font = UIFontMake(14);
    [self.view addSubview:phoneAlarmLabel];
    // 密码
    psdTextFiled = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(phoneAlarmLabel.frame), SCREEN_WIDTH - 40, 50)];
    psdTextFiled.secureTextEntry = YES;
    psdTextFiled.placeholder = @"请输入密码";
    psdTextFiled.textColor = [UIColor whiteColor];
    // 设置textFiled文字起始位子
    // 这种方法改变不了提示文字的起始位子
    //[psdTextFiled setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
    [SingleHelper setTextFiledStartPoint:psdTextFiled andLength:10];
    [SingleHelper addBordToView:psdTextFiled andColor:UIColor.whiteColor andRadius:25 BorderWith:1];
    [self.view addSubview:psdTextFiled];
    // 密码错误提示
    psdAlarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(psdTextFiled.frame), SCREEN_WIDTH - 60, 30)];
    psdAlarmLabel.textColor = [UIColor redColor];
    psdAlarmLabel.font = UIFontMake(14);
    psdAlarmLabel.text = @"您输入的密码错误,请重新输入...";
    [self.view addSubview:psdAlarmLabel];
    // 记住密码
    savePsdButton = [[QMUIButton alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(psdAlarmLabel.frame) + 5, 25, 25)];
    [SingleHelper addBordToView:savePsdButton andColor:UIColor.whiteColor andRadius:12.5 BorderWith:1];
    [savePsdButton setBackgroundImage:UIImageMake(@"check") forState:UIControlStateNormal];
    [savePsdButton setBackgroundImage:UIImageMake(@"checked") forState:UIControlStateSelected];
    [savePsdButton addTarget:self action:@selector(savePsdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savePsdButton];
    
    savePsdLabel = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(savePsdButton.frame) + 5, CGRectGetMaxY(psdAlarmLabel.frame) + 5, SCREEN_WIDTH - 80, 25)];
    savePsdLabel.textColor = [UIColor whiteColor];
    savePsdLabel.text = @"记住密码";
    [self.view addSubview:savePsdLabel];
    // 登入按钮
    loginButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(savePsdLabel.frame) + 20, SCREEN_WIDTH - 80, 50)];
    loginButton.titleLabel.textColor = [UIColor whiteColor];
    [loginButton setTitle:@"登  录" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [loginButton setBackgroundColor:UIColor.redColor];
    [SingleHelper addBordToView:loginButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    // 注册按钮
    registeredButton = [[QMUILinkButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(loginButton.frame) + 10, 65, 30)];
    registeredButton.titleLabel.font = UIFontMake(15);
    [registeredButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    registeredButton.underlineColor = [UIColor whiteColor];
    [registeredButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [registeredButton addTarget:self action:@selector(registerAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registeredButton];
    // 忘记密码
    forgetPsdButton = [[QMUILinkButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(loginButton.frame) - 65, CGRectGetMaxY(loginButton.frame) + 10, 65, 30)];
    forgetPsdButton.titleLabel.font = UIFontMake(15);
    [forgetPsdButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    forgetPsdButton.underlineColor = [UIColor whiteColor];
    [forgetPsdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPsdButton addTarget:self action:@selector(reFoundAccountPsd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPsdButton];
}

- (void)savePsdButtonClick:(QMUIButton *)sender{
    sender.selected = !sender.isSelected;
}

- (BOOL)shouldHideKeyboardWhenTouchInView:(UIView *)view{
    return YES;
}

- (void)selectArea{
    AreaSelectViewController * areaSelectVC = [[AreaSelectViewController alloc]init];
    [self.navigationController pushViewController:areaSelectVC animated:YES];
}

- (void)registerAccount{
    RegisteredWithAreaAndNumVC * registerVC = [[RegisteredWithAreaAndNumVC alloc]init];
    registerVC.countryId = self.countryId;
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)reFoundAccountPsd{
    ForgetPsdViewController * forgetVC = [[ForgetPsdViewController alloc]init];
    forgetVC.countryId = self.countryId;
    [self.navigationController pushViewController:forgetVC animated:YES];
}

- (void)login{
    NSLog(@"login api");
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
       NSDictionary *parameters = @{@"name":phoneTextFiled.text,
                                    @"area":@(_countryId),
                                    @"pwd":psdTextFiled.text};
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/login/index",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
           UserInfo.sharedSingleton.user = [UserModel mj_objectWithKeyValues:responseObj];
           [((AppDelegate *)UIApplication.sharedApplication.delegate) setRootVC];
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
