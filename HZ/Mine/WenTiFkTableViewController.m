//
//  WenTiTableViewController.m
//  HZ
//
//  Created by million on 2020/6/23.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "WenTiFkTableViewController.h"
#import "WenTiFk2ViewController.h"
#import "WenTiFkCell.h"

@interface WenTiFkTableViewController ()

@end

@implementation WenTiFkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
    [self initTable];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"问题反馈";
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
}

- (void)initTable {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ic_tianjia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WenTiFkCell class]) bundle:nil] forCellReuseIdentifier:@"cellId"];
}

- (void)rightItemClicked:(id)sender {
    [self performSegueWithIdentifier:NSStringFromClass([WenTiFk2ViewController class]) sender:nil];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WenTiFkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
