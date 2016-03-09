//
//  ZYSelectCell.h
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSelectCell : UITableViewCell
- (void)setInfomationWithIndex:(NSUInteger)index;//多选用（单选也用
- (void)setInfomationWithIndex:(NSUInteger)index selectIndex:(NSUInteger)selectIndex;//单选用，需要一个标志位
- (void)handleSelectEventWithTag:(NSUInteger)tag;//处理自身点击事件
- (void)setMultipleSelectWithIndex:(NSUInteger)index;//cell多选复用处理机制
@end
