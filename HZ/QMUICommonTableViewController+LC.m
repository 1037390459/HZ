//
//  QMUICommonTableViewController+LC.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "QMUICommonTableViewController+LC.h"

@implementation QMUICommonTableViewController (LC)
// 设置返回按钮颜色
- (void)setBackItem{
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc]init];
    backItem.image = [UIImage imageNamed:@"back_w"];
    self.navigationItem.backBarButtonItem = backItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

// 设置背景图片
- (void)setBackImage{
    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backImageView.image = UIImageMake(@"bj");
    [self.view addSubview:backImageView];
    [self.view sendSubviewToBack:backImageView];
    self.tableView.backgroundColor = UIColor.clearColor;
}

// 添加navigationbar 右边的按钮
- (void)creatBarRightBtnWithImageName:(NSString *)imgStr{
    UIBarButtonItem * rightBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImageMake(imgStr) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarBtnClick)];
    self.navigationItem.rightBarButtonItems = @[rightBarItem];
}

- (void)rightBarBtnClick{
    // 子类重写
}
@end
