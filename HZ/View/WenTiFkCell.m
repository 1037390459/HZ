//
//  WenTiFkCell.m
//  HZ
//
//  Created by million on 2020/6/28.
//  Copyright © 2020 李灿. All rights reserved.
//

#import "WenTiFkCell.h"

@interface WenTiFkCell()

@property (weak, nonatomic) IBOutlet UILabel *lbl1;

@property (weak, nonatomic) IBOutlet UILabel *lbl2;

@property (weak, nonatomic) IBOutlet UIStackView *stackView3;

@property (weak, nonatomic) IBOutlet UIImageView *imgV31;

@property (weak, nonatomic) IBOutlet UIImageView *imgV32;

@property (weak, nonatomic) IBOutlet UIImageView *imgV33;

@end

@implementation WenTiFkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
