//
//  ShiYongScTableViewController.m
//  HZ
//
//  Created by million on 2020/6/27.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "ShiYongScTableViewController.h"

@interface ShiYongScTableViewController ()

@end

@implementation ShiYongScTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
}

- (void)configNavigationItem{
    self.title = @"使用手册";
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    return cell;
}

@end
