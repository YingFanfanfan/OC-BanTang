//
//  BTAccountViewController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTAccountViewController.h"
#import "BTOrderViewController.h"
#import "BTSettingViewController.h"


@interface BTAccountViewController ()



@end

@implementation BTAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 添加导航栏两侧按钮
    [self setupNavBtn];
    
    
}


#pragma mark - 添加导航栏两侧按钮
- (void)setupNavBtn {
    
    // 订单按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"center_order_icon_44x44_"] style:UIBarButtonItemStyleDone target:self action:@selector(orderBtnClick)];
    
    // 设置按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingicon_44x44_"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClick)];
    
    self.navigationItem.leftBarButtonItem.imageInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    
    self.navigationItem.rightBarButtonItem.imageInsets = UIEdgeInsetsMake(0, -15, 0, 15);
    
}


#pragma mark - 点击导航栏按钮调用
- (void)orderBtnClick {
    NSLog(@"点击了订单按钮");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BTOrderViewController" bundle:nil];
    
    BTOrderViewController *orderVC = [storyboard instantiateInitialViewController];
    
    
    
    [self.navigationController pushViewController:orderVC animated:YES];
    
    
}

- (void)settingBtnClick {
    NSLog(@"点击了设置按钮");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BTSettingViewController" bundle:nil];
    
    BTSettingViewController *settingVC = [storyboard instantiateInitialViewController];
    
    [self.navigationController pushViewController:settingVC animated:YES];
    
}


@end
