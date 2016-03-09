//
//  ZYChaosSelectViewController.m
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "ZYChaosSelectViewController.h"
#import "ZYSelectCell.h"

@interface ZYChaosSelectViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrayMark;
@property (nonatomic, strong) NSMutableArray *arrayDiff;
@property (nonatomic, assign) NSUInteger selectIndex;//功能性的记录选中的index
@end

@implementation ZYChaosSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"混合";
    self.selectIndex = LONG_MAX;
    self.tableView.tableFooterView = [UIView new];
    self.arrayMark = [NSMutableArray array];
    for (NSUInteger i = 0; i < 10;  i++) {
        [self.arrayMark addObject:[NSNumber numberWithInteger:0]];
    }
    self.arrayDiff = [NSMutableArray array];
    for (NSUInteger i = 0; i < 20; i++) {
        if (i < 10) {
            [self.arrayDiff addObject:[NSNumber numberWithInteger:0]];
        }else {
            [self.arrayDiff addObject:[NSNumber numberWithInteger:1]];
        }
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYSelectCell" bundle:nil] forCellReuseIdentifier:identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDiff.count;//实际使用的模型数组count值
}

static NSString *identifier = @"ZYSelectCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[ZYSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSNumber *diff = self.arrayDiff[indexPath.row];
    if ([diff integerValue] == 0) {
        [cell setInfomationWithIndex:indexPath.row];
        [cell setMultipleSelectWithIndex:[self.arrayMark[indexPath.row] integerValue]];//实际使用时候往往是以某个模型的属性来判断
    }else {
        [cell setInfomationWithIndex:indexPath.row selectIndex:self.selectIndex];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSNumber *diff = self.arrayDiff[indexPath.row];
    if ([diff integerValue] == 0) {
        //NSNumber处理麻烦，模型处理简单，建议使用协议
        if ([self.arrayMark[indexPath.row] integerValue] == 0) {
            [self.arrayMark replaceObjectAtIndex:indexPath.row withObject:@(1)];
        }else {
            [self.arrayMark replaceObjectAtIndex:indexPath.row withObject:@(0)];
        }
        [cell handleSelectEventWithTag:indexPath.row];
    }else {
        [cell handleSelectEventWithTag:indexPath.row];//处理点击状态
        self.selectIndex = indexPath.row;//记录选中的index
        [tableView reloadData];//刷新tableview看效果
    }
}

@end
