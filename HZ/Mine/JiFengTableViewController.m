//
//  JiFengTableViewController.m
//  HZ
//
//  Created by million on 2020/6/23.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "JiFengTableViewController.h"

@interface JiFengTableViewController ()

@end

@implementation JiFengTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
    [self initTable];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"我的积分";
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
}

- (void)initTable {
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    return cell;
}

@end
