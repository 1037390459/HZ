//
//  MineViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "MineTableViewController.h"
#import "NotificationTableViewController.h"
#import "OrderTableViewController.h"

@interface MineTableViewController ()

@end

@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
    [self initTable];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"个人中心";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_xinxic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
}

- (void)rightItemClicked:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([NotificationTableViewController class]) sender:nil];
}

- (void)initTable {
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

#pragma mark IBAction
- (IBAction)waitToPay:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([OrderTableViewController class]) sender:nil];
}

- (IBAction)waitToSend:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([OrderTableViewController class]) sender:nil];
}

- (IBAction)waitToAppraise:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([OrderTableViewController class]) sender:nil];
}

- (IBAction)tranSuc:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([OrderTableViewController class]) sender:nil];
}

#pragma mark tableview delegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
