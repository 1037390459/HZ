//
//  PayWayTableViewCell.m
//  HZ
//
//  Created by 李灿 on 2019/9/23.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "PayWayTableViewCell.h"

@implementation PayWayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubviews];
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)creatSubviews{
    _selectBtn = [[QMUIButton alloc]initWithFrame:CGRectMake(10, 15, 30, 30)];
    [SingleHelper addBordToView:_selectBtn andColor:UIColor.whiteColor andRadius:15 BorderWith:0.5];
    [_selectBtn setImage:UIImageMake(@"check") forState:UIControlStateNormal];
    [_selectBtn setImage:UIImageMake(@"checked") forState:UIControlStateSelected];
    [self addSubview:_selectBtn];
    [_selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _payMentImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_selectBtn.frame) + 10, 10, 50, 50)];
    [self addSubview:_payMentImg];
    
    _payMentTitle = [[QMUILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_payMentImg.frame) + 10, 15, SCREEN_WIDTH - 110, 30)];
    _payMentTitle.textColor = UIColor.whiteColor;
    [self addSubview:_payMentTitle];
}

- (void)setSubviewWithModel:(PayMentModel *)model{
    _model = model;
    _selectBtn.selected = model.isSelect;
    _payMentImg.image = UIImageMake(model.imageStr);
    _payMentTitle.text = model.titleStr;
}

- (void)selectClick:(QMUIButton *)sender{
    [self.delegate selectBtnClick];
    sender.selected = !sender.isSelected;
    _model.isSelect = sender.isSelected;
    [self.delegate updateTableView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
