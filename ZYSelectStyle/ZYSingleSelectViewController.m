//
//  ZYSingleSelectViewController.m
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "ZYSingleSelectViewController.h"
#import "ZYSelectCell.h"

@interface ZYSingleSelectViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSUInteger selectIndex;//功能性的记录选中的index
@end

@implementation ZYSingleSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"单选";
    self.tableView.tableFooterView = [UIView new];//清空尾巴
    self.selectIndex = LONG_MAX;//设置最大值，使用了NSUInteger，不设置负数判断
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYSelectCell" bundle:nil] forCellReuseIdentifier:identifier];//注册xib的cell
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

static NSString *identifier = @"ZYSelectCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[ZYSelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setInfomationWithIndex:indexPath.row selectIndex:self.selectIndex];//设置cell初始值，带着选中的index
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYSelectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell handleSelectEventWithTag:indexPath.row];//处理点击状态
    self.selectIndex = indexPath.row;//记录选中的index
    [tableView reloadData];//刷新tableview看效果
}

@end
