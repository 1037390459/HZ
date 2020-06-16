//
//  GoodOrderViewController.m
//  HZ
//
//  Created by 李灿 on 2019/9/21.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "GoodOrderViewController.h"
#import "FillInOrderViewController.h"
@interface GoodOrderViewController ()

@property (nonatomic, assign) CGFloat currentY;
@property (nonatomic, strong) NSMutableArray * typeArr;

@end

@implementation GoodOrderViewController

- (NSMutableArray *)typeArr{
    if (!_typeArr) {
        _typeArr = [NSMutableArray arrayWithObjects:@"富贵金",@"纯白",@"低调银",@"茉莉白",@"玫瑰金", nil];
    }
    return _typeArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSubviews];
    // Do any additional setup after loading the view.
}

- (void)creatSubviews{
    UIImageView * goodImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3)];
    goodImgView.image = UIImageMake(@"bjb");
    [self.view addSubview:goodImgView];
    
    UIScrollView * selectGoodAttrsView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(goodImgView.frame), SCREEN_WIDTH, SCREEN_HEIGHT/3*2)];
    selectGoodAttrsView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:selectGoodAttrsView];
    
    UIImageView * selectGoodImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, SCREEN_WIDTH/2 - 20, SCREEN_WIDTH/2 - 40)];
    selectGoodImg.image = UIImageMake(@"bjb");
    [selectGoodAttrsView addSubview:selectGoodImg];
    
    QMUILabel * goodNameLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(selectGoodImg.frame) + 10, 20, SCREEN_WIDTH - CGRectGetWidth(selectGoodImg.frame) - 30, CGRectGetHeight(selectGoodImg.frame)/2)];
    goodNameLab.text = @"赫兹超安静超简单新一代便捷式扫地机,你值得拥有";
    goodNameLab.font = UIFontMake(14);
    goodNameLab.numberOfLines = 0;
    [selectGoodAttrsView addSubview:goodNameLab];
    
    QMUILabel * priceLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(goodNameLab.frame), CGRectGetMaxY(goodNameLab.frame) + 10, CGRectGetWidth(goodNameLab.frame), 30)];
    priceLab.text = @"¥102013";
    priceLab.textColor = [UIColor redColor];
    [selectGoodAttrsView addSubview:priceLab];
    
    QMUILabel * goodCountLab = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(goodNameLab.frame), CGRectGetMaxY(priceLab.frame) + 10, CGRectGetWidth(priceLab.frame), 30)];
    goodCountLab.textColor = [UIColor grayColor];
    goodCountLab.text = @"我还有好多库存,你放心购买！";
    goodCountLab.font = UIFontMake(13);
    [selectGoodAttrsView addSubview:goodCountLab];
    
    CGFloat y = 0;
    if (CGRectGetMaxY(selectGoodImg.frame) > CGRectGetMaxY(goodNameLab.frame)) {
        y = CGRectGetMaxY(selectGoodImg.frame) + 10;
    }else{
        y = CGRectGetMaxY(goodNameLab.frame) + 10;
    }
    [selectGoodAttrsView addSubview:[self creatHLineWithY:y]];
    
    QMUILabel * attrLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, y + 20, SCREEN_WIDTH, 30)];
    attrLab.text = @"颜色";
    [selectGoodAttrsView addSubview:attrLab];
    
    y = CGRectGetMaxY(attrLab.frame) + 10;

    CGFloat padding = 30;
    CGFloat width =  (SCREEN_WIDTH - padding*4)/3;
    
    for (int i= 0; i < self.typeArr.count; i++) {
        int row = i / 3;
        int colunm = i % 3;

        UIButton * btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(padding + (width + padding)*colunm, y + row*(10 + 30), width, 30);
        [btn setTitle:_typeArr[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:UIColorMake(30, 40, 50)];
        [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [selectGoodAttrsView addSubview:btn];
        [SingleHelper addBordToView:btn andColor:UIColor.clearColor andRadius:3 BorderWith:0];
        if (i == (self.typeArr.count - 1)) {
            y = CGRectGetMaxY(btn.frame) + 10;
        }
    }
    
    [selectGoodAttrsView addSubview:[self creatHLineWithY:y]];
    
    QMUILabel * countLab = [[QMUILabel alloc]initWithFrame:CGRectMake(10, y + 10, 120, 30)];
    countLab.text = @"购买数量";
    [selectGoodAttrsView addSubview:countLab];
    
    QMUIButton * addBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, CGRectGetMinY(countLab.frame), 30, 30)];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [selectGoodAttrsView addSubview:addBtn];

    QMUILabel * nowCount = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addBtn.frame) + 5, CGRectGetMinY(countLab.frame), 30, 30)];
    nowCount.text = @"1";
    nowCount.textAlignment = NSTextAlignmentCenter;
    [selectGoodAttrsView addSubview:nowCount];
    
    QMUIButton * delBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nowCount.frame) + 5, CGRectGetMinY(countLab.frame), 30, 30)];
    [delBtn setTitle:@"-" forState:UIControlStateNormal];
    [selectGoodAttrsView addSubview:delBtn];
    
    QMUIButton * okBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(delBtn.frame) + 20, SCREEN_WIDTH - 80, 50)];
    [okBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [okBtn setBackgroundColor:UIColor.redColor];
    [okBtn setTitle:@"确   定" forState:UIControlStateNormal];
    [selectGoodAttrsView addSubview:okBtn];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [SingleHelper addBordToView:okBtn andColor:UIColor.clearColor andRadius:25 BorderWith:0];
    
    selectGoodAttrsView.contentSize = CGSizeMake(1, CGRectGetMaxY(okBtn.frame) + 30);
}

- (void)okBtnClick{
    FillInOrderViewController * fillInOrderVC = [[FillInOrderViewController alloc]init];
    [self.navigationController pushViewController:fillInOrderVC animated:YES];
}

- (UIView *)creatHLineWithY:(CGFloat)y{
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(10, y, SCREEN_WIDTH - 20, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    return lineView;
}

@end
