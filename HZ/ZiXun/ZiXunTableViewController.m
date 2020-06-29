//
//  ZiXunTableViewController.m
//  HZ
//
//  Created by million on 2020/6/29.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "ZiXunTableViewController.h"
#import "ZiXunModel.h"

@interface ZiXunTableViewController ()

@property(nonatomic, strong) NSMutableArray *mData;

@property(nonatomic, assign) NSInteger pageNo;

@property(nonatomic, assign) NSInteger pageSize;
 
@end

@implementation ZiXunTableViewController

- (NSMutableArray *)mData {
    if (!_mData) {
        _mData = [NSMutableArray array];
    }
    return _mData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSettings];
    [self configNavigationItem];
    [self initTable];
    [self setBackgroundImage];
    [self requestData];
}

- (void)initSettings {
    _pageNo = 1;
    _pageSize = 10;
}

- (void)configNavigationItem{
    self.title = @"咨询";
}

- (void)setBackgroundImage {
    UIImageView *bgImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bj"]];
    bgImgv.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundView = bgImgv;
}

- (void)initTable {
    @weakify(self);
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        @strongify(self);
//        self.pageNo = 1;
//        [self.mData removeAllObjects];
//        [self requestData];
//    }];
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        self.pageNo += 1;
        [self requestData];
    }];
}

- (void)requestData {
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
       @weakify(self);
       NSDictionary *parameters = @{@"page":@(self.pageNo),
                                    @"size":@(self.pageSize)};
       [[self class]POST:[NSString stringWithFormat:@"%@/index.php/Article/article_list_zixun",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
           @strongify(self);
           [self.tableView.mj_header endRefreshing];
           [self.tableView.mj_footer endRefreshing];
           [MBProgressHUD hideHUDForView:self.view animated:false];
           if (error) {
               [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
               return;
           }
           NSArray<ZiXunModel *> *zixuns = [ZiXunModel mj_objectArrayWithKeyValuesArray:responseObj];
           if (zixuns.count == 0) {
               [self.tableView.mj_footer endRefreshingWithNoMoreData];
           }
           [self.mData addObjectsFromArray:zixuns];
           [self.tableView reloadData];
       }];
}

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    UILabel *titleLbl = [cell viewWithTag:101];
    UILabel *contentLbl = [cell viewWithTag:102];
    ZiXunModel *model = self.mData[indexPath.row];
    titleLbl.text = model.title;
    contentLbl.text = model.centons;
    return cell;
}


@end
