//
//  ZYMultipleSelectViewController.m
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "ZYMultipleSelectViewController.h"
#import "ZYSelectCell.h"

@interface ZYMultipleSelectViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrayMark;//标记多选的数组，实际中使用的模型数组
@end

@implementation ZYMultipleSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多选";
    self.tableView.tableFooterView = [UIView new];
    self.arrayMark = [NSMutableArray array];
    for (NSUInteger i = 0; i < 30;  i++) {
        [self.arrayMark addObject:[NSNumber numberWithInteger:0]];
    }
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYSelectCell" bundle:nil] forCellReuseIdentifier:identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayMark.count;//实际使用的模型数组count值
}

static NSString *identifier = @"ZYSelectCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[ZYSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setInfomationWithIndex:indexPath.row];
    [cell setMultipleSelectWithIndex:[self.arrayMark[indexPath.row] integerValue]];//实际使用时候往往是以某个模型的属性来判断
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSNumber处理麻烦，模型处理简单，建议使用协议
    if ([self.arrayMark[indexPath.row] integerValue] == 0) {
        [self.arrayMark replaceObjectAtIndex:indexPath.row withObject:@(1)];
    }else {
        [self.arrayMark replaceObjectAtIndex:indexPath.row withObject:@(0)];
    }
    [cell handleSelectEventWithTag:indexPath.row];
}

@end
