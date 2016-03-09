//
//  ZYSelectCell.m
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "ZYSelectCell.h"

@interface ZYSelectCell()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSelect;
@property (nonatomic, assign) BOOL singleSelect;
@property (nonatomic, assign) BOOL isSelected;
@end

@implementation ZYSelectCell

- (void)setInfomationWithIndex:(NSUInteger)index {
    self.labelTitle.text = [NSString stringWithFormat:@"选项：%zd", index + 1];
    self.tag = index;
}

- (void)setMultipleSelectWithIndex:(NSUInteger)index {
    [self setSingleSelect:NO];//混合使用时的处理
    self.isSelected = NO;//重置为未选，复用
    if (index == 1) {//标志位为选中
        self.isSelected = YES;
    }
}

- (void)setInfomationWithIndex:(NSUInteger)index selectIndex:(NSUInteger)selectIndex{
    [self setSingleSelect:YES];//设置单选标志
    [self setInfomationWithIndex:index];
    self.isSelected = NO;//重置为未选，复用
    if (self.tag == selectIndex) {//标志位为选中
        self.isSelected = YES;
    }
}

- (void)handleSelectEventWithTag:(NSUInteger)tag {
    self.isSelected = !self.isSelected;
    if (self.singleSelect) {//单选需要记录哪个选中
        if (self.tag == tag) {
            self.isSelected = YES;
        }
    }else {
        //多选啥也不做
    }
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (self.singleSelect) {
        if (_isSelected) {
            self.imageViewSelect.image = [UIImage imageNamed:@"danxuanzhong"];
        }else {
            self.imageViewSelect.image = [UIImage imageNamed:@"danxuan"];
        }
    }else {
        if (_isSelected) {
            self.imageViewSelect.image = [UIImage imageNamed:@"fuxuanzhong"];
        }else {
            self.imageViewSelect.image = [UIImage imageNamed:@"fuxuan"];
        }
    }
}

/*原生互斥，多选不能用
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        if (self.singleSelect) {
            self.imageViewSelect.image = [UIImage imageNamed:@"danxuanzhong"];
        }else {
            self.imageViewSelect.image = [UIImage imageNamed:@"fuxuanzhong"];
        }
    }
    
    else {
        if (self.singleSelect) {
            self.imageViewSelect.image = [UIImage imageNamed:@"danxuan"];
        }else {
            self.imageViewSelect.image = [UIImage imageNamed:@"fuxuan"];
        }
    }
}
*/
@end
