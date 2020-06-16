//
//  PayWayViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "PayWayViewController.h"
#import "PayWayTableViewCell.h"
#import "PayMentModel.h"
@interface PayWayViewController () <PayWayTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray<PayMentModel *> * modelArr;

@end

@implementation PayWayViewController

- (NSMutableArray<PayMentModel *> *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
        PayMentModel * model1 = [[PayMentModel alloc]initWithIsSelect:YES andImageStr:@"ic_weixin" andTitleStr:@"微信支付"];
        PayMentModel * model2 = [[PayMentModel alloc]initWithIsSelect:NO andImageStr:@"ic_zhifubao" andTitleStr:@"支付宝支付"];
        PayMentModel * model3 = [[PayMentModel alloc]initWithIsSelect:NO andImageStr:@"ic_visa" andTitleStr:@"VISA 支付"];
        PayMentModel * model4 = [[PayMentModel alloc]initWithIsSelect:NO andImageStr:@"ic_paypai" andTitleStr:@"PayPal 支付"];
        [_modelArr addObject:model1];
        [_modelArr addObject:model2];
        [_modelArr addObject:model3];
        [_modelArr addObject:model4];
    }
    return _modelArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.title = @"支付方式";
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self initSubviews];
    [self registerCell];
    [self addOKBtn];
}

- (void)addOKBtn{
    QMUIButton * okBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(40,SCREEN_HEIGHT - 100, SCREEN_WIDTH - 80, 50)];
    [okBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okBtn setBackgroundColor:UIColor.redColor];
    [okBtn setTitle:@"确   定" forState:UIControlStateNormal];
    [self.view addSubview:okBtn];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [SingleHelper addBordToView:okBtn andColor:UIColor.clearColor andRadius:25 BorderWith:0];
}

- (void)okBtnClick{
    NSLog(@"确认支付");
}

- (void)registerCell{
    self.tableView.backgroundColor = UIColor.clearColor;
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.tableView registerClass:[PayWayTableViewCell class] forCellReuseIdentifier:@"PayWayTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PayWayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayWayTableViewCell"];
    cell.delegate = self;
    [cell setSubviewWithModel:_modelArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark --------------PayWayTableViewCellDelegate-----------
- (void)selectBtnClick{
    for (PayMentModel * model in _modelArr) {
        model.isSelect = NO;
    }
}

- (void)updateTableView{
    [self.tableView reloadData];
}

@end
