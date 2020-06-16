//
//  MarketViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/19.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "MarketViewController.h"
#import "LCMarketCollectionHeaderView.h"
#import "MarketCollectionViewCell.h"
#import "MarketCellModel.h"
#import "GoodOrderViewController.h"

@interface MarketViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray <MarketCellModel *> * cellDataArr;
@end

@implementation MarketViewController

- (NSMutableArray<MarketCellModel *> *)cellDataArr{
    if (!_cellDataArr) {
        _cellDataArr = [NSMutableArray array];
        MarketCellModel * model = [[MarketCellModel alloc]init];
        model.goodsName = @"这是一件优秀的商品";
        model.goodsPrice = @"就是这么贵，爱买不买";
        model.goodImgStr = @"bja";
        [_cellDataArr addObject:model];
    }
    return _cellDataArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super setupNavigationItems];
    self.view.backgroundColor = UIColorMake(50, 50, 50);
    [self.navigationController.navigationBar setBackgroundImage:[SingleHelper imageWithColor:UIColor.clearColor] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(21) andColor:[UIColor whiteColor]]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self setNavigationBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackImage];
    [self creatSubviews];
}

- (void)creatSubviews{
    // 布局
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 30)/2, (SCREEN_WIDTH - 30)/2 + 55);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.headerReferenceSize = CGSizeMake(320, 30);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NavigationContentTop, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationContentTop - TabBarHeight) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor =  UIColor.clearColor;
    [_collectionView registerClass:[MarketCollectionViewCell class] forCellWithReuseIdentifier:@"MarketCollectionViewCell"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView addSubview:[self creatHeaderView]];
    
    [self.view addSubview:_collectionView];
}

- (void)setNavigationBar{
    UIBarButtonItem * locationBarBtn = [[UIBarButtonItem alloc]initWithImage:[UIImageMake(@"ic_dizhi") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(locationClick)];
    self.navigationItem.leftBarButtonItems = @[locationBarBtn];
    
    UIBarButtonItem * collectBarBtn = [[UIBarButtonItem alloc]initWithImage:[UIImageMake(@"ic_shoucang") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(collcetClick)];
    
    UIBarButtonItem * shopCartBarBtn = [[UIBarButtonItem alloc]initWithImage:[UIImageMake(@"ic_gouwuche") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(shopCartClick)];
    
    self.navigationItem.rightBarButtonItems = @[shopCartBarBtn,collectBarBtn];
    
    QMUITextField * searchText = [[QMUITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 180, 30)];
    searchText.backgroundColor = UIColorMake(72, 75, 82);
    [SingleHelper addBordToView:searchText andColor:UIColor.clearColor andRadius:3 BorderWith:0];
    self.navigationItem.titleView = searchText;
    searchText.placeholder = @"请输入要搜索的商品";
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, 30, 20)];
    UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 20, 20)];
    leftImgView.image = UIImageMake(@"ic_sousuo");
    [leftView addSubview:leftImgView];
    searchText.leftView = leftView;
    searchText.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)locationClick{
    
}

- (void)collcetClick{
    
}

- (void)shopCartClick{
    
}

#pragma mark ----------- UICollectionViewDelegate ------------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MarketCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MarketCollectionViewCell" forIndexPath:indexPath];
    [SingleHelper addBordToView:cell andColor:UIColor.clearColor andRadius:8 BorderWith:0];
    [cell setSubviewsWithModel:self.cellDataArr[0]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(SCREEN_HEIGHT/3 - 60, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodOrderViewController * goodOrderVC = [[GoodOrderViewController alloc]init];
    goodOrderVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodOrderVC animated:YES];
}

- (LCMarketCollectionHeaderView *)creatHeaderView{
    LCMarketCollectionHeaderView * headerView = [[LCMarketCollectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3 - 80)];
    return headerView;
}

@end
