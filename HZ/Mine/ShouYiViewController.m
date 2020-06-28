//
//  ShouYiViewController.m
//  HZ
//
//  Created by million on 2020/6/23.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "ShouYiViewController.h"
#import "FeiYongMxTableViewController.h"

@interface ShouYiViewController ()

@end

@implementation ShouYiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"我的收益";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"明细" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view insertSubview:bgImgv atIndex:0];
}

- (void)rightItemClicked:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([FeiYongMxTableViewController class]) sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NSStringFromClass([FeiYongMxTableViewController class])]) {
        FeiYongMxTableViewController *vc = segue.destinationViewController;
    }
}


@end
