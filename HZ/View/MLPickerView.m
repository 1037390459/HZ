//
//  ETSmsSheetView.m
//  SmartTrack
//
//  Created by 陈明 on 2018/1/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLPickerView.h"

@interface MLPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *mdata;

@end

@implementation MLPickerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
       [self initSettings];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSettings];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame Data:(NSArray *)data {
    if (self = [self initWithFrame:frame]) {
        self.mdata = data;
    }
    return self;
}

- (void)initSettings{
    self.selectedIndexPaths = [NSArray array];
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    [self configureTheme];
    [self setUpUI];
}

-(NSArray *)getSelectedIndexPaths {
    NSMutableArray *selectedIndexPaths = [NSMutableArray array];
    NSInteger columnCount = [self numberOfComponentsInPickerView:self.pickerView];
    for (int column = 0; column<columnCount; column++) {
        NSInteger row = [self.pickerView selectedRowInComponent:column];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:column];
        [selectedIndexPaths addObject:indexPath];
    }
    return selectedIndexPaths;
}

-(void)setSelectedIndexPaths:(NSMutableArray *)selectedIndexPaths {
    _selectedIndexPaths = selectedIndexPaths;
    for (NSIndexPath *indexPath in _selectedIndexPaths) {
        [self.pickerView selectRow:indexPath.row inComponent:indexPath.section animated:NO];
    }
}

- (void)configureTheme{
    
}

- (void)setUpUI{
    self.pickerView.tintColor = nil;
//    [_cancelBtn bk_addEventHandler:^(id sender) {
//        !weakSelf.onCancel ?: weakSelf.onCancel();
//    } forControlEvents:UIControlEventTouchUpInside];
//
//    [_sureBtn bk_addEventHandler:^(id sender) {
//        weakSelf.selectedIndexPaths = [weakSelf getSelectedIndexPaths];
//        !weakSelf.onSure ?: weakSelf.onSure(weakSelf);
//    } forControlEvents:UIControlEventTouchUpInside];
}

- (NSString *)text {
    return nil;
}

-(void)setText:(NSString *)text {
   
}

#pragma mark pickerView datasource & delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.mdata.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.mdata[component] count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.mdata[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
}

@end
