//
//  BTOrderViewController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTOrderViewController.h"

@interface BTOrderViewController ()

@end

@implementation BTOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的订单";
    
    self.tableView.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}



@end
