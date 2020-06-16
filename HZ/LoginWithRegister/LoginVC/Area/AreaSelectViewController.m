//
//  AreaSelectViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/17.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "AreaSelectViewController.h"

@interface AreaSelectViewController ()
// 地区数组
@property (nonatomic, strong) NSMutableArray * areaArray;
// 按钮数组
@property (nonatomic, strong) NSMutableArray <QMUIButton *> * btnArray;

@end

@implementation AreaSelectViewController

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    self.title = @"选择地区";
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self setBackItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self initSubviews];
    self.tableView.backgroundColor = UIColor.clearColor;
}

- (NSMutableArray *)areaArray{
    if (!_areaArray) {
        _areaArray = [NSMutableArray arrayWithObjects:
                      @"中国",
                      @"澳大利亚",
                      @"巴西",
                      @"文莱",
                      @"丹麦",
                      @"卢森堡",
                      @"巴拉圭",
                      @"波兰",
                      @"美国",
                      @"加拿大",
                      @"新加坡",
                      @"马来西亚",
                      @"台湾",
                      @"比利时", nil];
    }
    return _areaArray;
}

- (NSMutableArray<QMUIButton *> *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (void)selectBtnClick:(QMUIButton *)btn{
    for (QMUIButton * button in _btnArray) {
        if (btn != button) {
            button.selected = NO;
        }else{
            button.selected = YES;
        }
    }
}

#pragma mark -------------- tableviewDelegate ----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.areaArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"areaCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _areaArray[indexPath.row];
    cell.textLabel.textColor = UIColor.whiteColor;
    QMUIButton * selectBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 15, 20, 20)];
    [SingleHelper addBordToView:selectBtn andColor:UIColor.whiteColor andRadius:10 BorderWith:0.5];
    [cell addSubview:selectBtn];
    selectBtn.tag = 10000 + indexPath.row;
    [selectBtn setImage:UIImageMake(@"") forState:UIControlStateNormal];
    [selectBtn setImage:UIImageMake(@"redPoint") forState:UIControlStateSelected];
    [self.btnArray addObject:selectBtn];
    [selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.row == 0) {
        selectBtn.selected = YES;
    }
    cell.backgroundColor = UIColorMake(50, 50, 50);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
