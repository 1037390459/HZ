//
//  NotificationTableViewController.m
//  HZ
//
//  Created by million on 2020/6/23.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "NotificationTableViewController.h"
#import "NotificationCell.h"

@interface NotificationTableViewController ()



@end

@implementation NotificationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
    [self initTable];
}

- (void)configNavigationItem{
    self.navigationItem.title = @"消息中心";
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清除" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NotificationCell class]) bundle:nil] forCellReuseIdentifier:@"cellId"];
}

- (void)rightItemClicked:(id)sender {
    
}

- (void)initTable {
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}


#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    return cell;
}

@end
