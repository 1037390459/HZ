//
//  DeviceViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "DeviceViewController.h"
#import "DeviceCell.h"
#import "DeviceCellModel.h"
#import "AddDeviceViewController.h"
#import "DeviceDetailViewController.h"
@interface DeviceViewController ()
// 设备模型数组
@property (nonatomic, strong) NSMutableArray<DeviceCellModel *> * dataArr;

@end

@implementation DeviceViewController

- (NSMutableArray<DeviceCellModel *> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self creatBarRightBtnWithImageName:@"ic_tianjia"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self initSubviews];
    [self registerCell];
    [self getDeviceList];
}

- (void)getDeviceList {
    NSLog(@"getDeviceList api");
       [MBProgressHUD showHUDAddedTo:self.view animated:true];
          @weakify(self);
          NSDictionary *parameters = @{@"uuid":UserInfo.sharedSingleton.user.uuid,
                                       };
          [[self class]POST:[NSString stringWithFormat:@"%@/index.php/Sn/sn_list",HOST_URL] parameters:parameters progress:nil completionHandler:^(id responseObj, NSError *error) {
              @strongify(self);
              [MBProgressHUD hideHUDForView:self.view animated:false];
              if (error) {
                  [MBProgressHUD showWarning:error.localizedDescription toView:self.view];
                  return;
              }
              NSArray<DeviceCellModel *> *devices = [DeviceCellModel mj_objectArrayWithKeyValuesArray:responseObj];
              [self.dataArr addObjectsFromArray:devices];
              [self.tableView reloadData];
          }];
}

- (void)rightBarBtnClick{
    AddDeviceViewController * addVC = [[AddDeviceViewController alloc]init];
    addVC.doneBlock = ^{
        [self getDeviceList];
    };
    [self.navigationController pushViewController:addVC animated:YES];
    addVC.hidesBottomBarWhenPushed = YES;
}

- (void)registerCell{
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.tableView registerClass:[DeviceCell class] forCellReuseIdentifier:@"DeviceCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DeviceCell * cell = [[DeviceCell alloc]init];
    [cell setSubviewsWithModel:self.dataArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DeviceDetailViewController * detailVC = [[DeviceDetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
