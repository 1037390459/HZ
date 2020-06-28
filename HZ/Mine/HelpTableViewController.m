//
//  HelpViewController.m
//  HZ
//
//  Created by million on 2020/6/22.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "HelpTableViewController.h"

@interface HelpTableViewController ()

@end

@implementation HelpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigationItem];
    [self setBackgroundImage];
}

- (void)configNavigationItem{
    self.title = @"常见问题";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
