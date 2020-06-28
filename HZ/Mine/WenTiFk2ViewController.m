//
//  WenTiFk2ViewController.m
//  HZ
//
//  Created by million on 2020/6/28.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "WenTiFk2ViewController.h"

@interface WenTiFk2ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *sujectTf;

@property (weak, nonatomic) IBOutlet UITextField *contentTf;


@end

@implementation WenTiFk2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
    [self setUpUI];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"问题反馈";
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view insertSubview:bgImgv atIndex:0];
}

- (void)setUpUI {
    self.sujectTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入问题反馈的主题" attributes:
    @{NSForegroundColorAttributeName:[UIColor whiteColor],
                 NSFontAttributeName:[UIFont systemFontOfSize:12]
         }];
    
    self.contentTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入问题反馈的内容" attributes:
    @{NSForegroundColorAttributeName:[UIColor whiteColor],
                 NSFontAttributeName:[UIFont systemFontOfSize:12]
         }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
