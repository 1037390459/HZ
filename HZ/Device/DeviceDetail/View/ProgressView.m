//
//  ProgressView.m
//  HZ
//
//  Created by 李灿 on 2019/9/20.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLabel = [[UILabel alloc]init];
        self.progressLabel.frame = CGRectMake(0, self.frame.size.height/2 - 20, self.frame.size.width, 25);
        self.progressLabel.font = [UIFont systemFontOfSize:18.f];
        self.progressLabel.textColor = [UIColor whiteColor];
        self.progressLabel.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.progressLabel];
        
        UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.progressLabel.frame) + 2, self.frame.size.width, 25)];
        titleLab.text = title;
        titleLab.font = [UIFont systemFontOfSize:14.f];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = [UIColor whiteColor];
        [self addSubview:titleLab];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2 - 2;
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = -M_PI_2 + M_PI * 2 * self.progress;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CGContextSetLineWidth(ctx, 5);
    if (self.progress < 0.30) {
        [[UIColor redColor] set];
    }else{
        [[UIColor greenColor] set];
    }
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

@end
