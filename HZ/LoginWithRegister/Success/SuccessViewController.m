//
//  SuccessViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/18.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController (){
    // 成功展示图
    UIImageView * successImageView;
    // 提示标签
    QMUILabel * alarmLabel;
    // 确定按钮
    QMUIButton * okButton;
}

@end

@implementation SuccessViewController

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
    // 成功展示图
    successImageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 180)/2, NavigationContentTop + 40, 180, 180)];
    [self.view addSubview:successImageView];
    
    // 成功提示标签
    alarmLabel = [[QMUILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 180)/2, CGRectGetMaxY(successImageView.frame) + 30, 180, 30)];
    alarmLabel.textColor = [UIColor redColor];
    alarmLabel.textAlignment = NSTextAlignmentCenter;
    alarmLabel.font = UIFontMake(14);
    [self.view addSubview:alarmLabel];
    
    // 确定按钮
    okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(alarmLabel.frame) + 50, SCREEN_WIDTH - 80, 50)];
    [okButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okButton setBackgroundColor:UIColor.redColor];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [okButton addTarget:self action:@selector(okButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [okButton setTitle:@"确   定" forState:UIControlStateNormal];
    [self.view addSubview:okButton];
    
    if ([_naviTitle isEqualToString:@"重置密码"]) {
        successImageView.image = UIImageMake(@"ic_zhongzhimima");
        alarmLabel.text = @"密码重置成功~";
    }else if([_naviTitle isEqualToString:@"注册账号"]){
        successImageView.image = UIImageMake(@"ic_chenggong");
        alarmLabel.text = @"新用户注册成功~";
    }
}

- (void)okButtonClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
