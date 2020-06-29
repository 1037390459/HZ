//
//  OrderCell.m
//  HZ
//
//  Created by million on 2020/6/29.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "OrderCell.h"

@interface OrderCell()

@property (weak, nonatomic) IBOutlet UIButton *payBtn;

@end

@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.payBtn.layer.borderWidth = 1;
    self.payBtn.layer.borderColor = [UIColor qmui_colorWithHexString:@"#ff0000"].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
