//
//  ViewController.m
//  ZYSelectStyle
//
//  Created by 赵越 on 16/3/9.
//  Copyright © 2016年 赵越. All rights reserved.
//

#import "ViewController.h"
#import "ZYSingleSelectViewController.h"
#import "ZYMultipleSelectViewController.h"
#import "ZYChaosSelectViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"方式";
}

- (IBAction)selectClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self.navigationController pushViewController:[ZYSingleSelectViewController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[ZYMultipleSelectViewController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[ZYChaosSelectViewController new] animated:YES];
            break;
    }
}

@end
