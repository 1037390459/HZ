//
//  AddDeviceSuccessController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "AddDeviceSuccessController.h"

@implementation AddDeviceSuccessController{
    QMUITextField * nameText;
}

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"添加成功";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
}

- (void)creatSubviews{
    QMUILabel * deviceNameLab = [[QMUILabel alloc]initWithFrame:CGRectMake(20, NavigationContentTop + 20, SCREEN_WIDTH - 40, 30)];
    deviceNameLab.textColor = [UIColor whiteColor];
    deviceNameLab.text = @"设备名称";
    [self.view addSubview:deviceNameLab];
    
    nameText = [[QMUITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(deviceNameLab.frame) + 15, SCREEN_WIDTH - 40, 30)];
    [SingleHelper addBordToView:nameText andColor:UIColor.clearColor andRadius:5 BorderWith:0];
    nameText.backgroundColor = UIColorMake(73, 75, 82);
    nameText.placeholder = @"智能扫地机";
    [self.view addSubview:nameText];
    
    QMUIButton * okButton = [[QMUIButton alloc]initWithFrame:CGRectMake(40, SCREEN_HEIGHT - 120, SCREEN_WIDTH - 80, 50)];
    okButton.backgroundColor = UIColor.redColor;
    [okButton setTitle:@"完   成" forState:UIControlStateNormal];
    [SingleHelper addBordToView:okButton andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    [okButton addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
    
    UIImageView * rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(nameText.frame.size.width - 30, 10, 15, 15)];
    rightImg.image = UIImageMake(@"ic_bianjia");
    nameText.rightView = rightImg;
    nameText.rightViewMode = UITextFieldViewModeAlways;
}

- (void)okBtnClick{
    NSLog(@"add device api");
    NSString *name = nameText.text.length != 0 ? nameText.text : nameText.placeholder;
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
       NSDictionary *parameters = @{@"name":name,
                                    @"mac":@(0xCC50E36299D6),
                                    @"uuid":UserInfo.sharedSingleton.user.uuid};
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/Sn/user_sn",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
           self.doneBlock();
           [self.navigationController popToRootViewControllerAnimated:YES];
       }];
}

@end
