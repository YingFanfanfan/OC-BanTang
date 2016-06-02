//
//  BTTabBarVC.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTTabBarVC.h"
#import "BTNavigationController.h"
#import "BTHomeViewController.h"
#import "BTAccountViewController.h"
#import "BTMessageViewController.h"
#import "BTDiscoverViewController.h"

#import "BTTabBar.h"


@interface BTTabBarVC ()

@end

@implementation BTTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self setupAllChildVC];
    
    // 自定义TabBar
    [self setupTabBar];
    
}


#pragma mark - 自定义TabBar
- (void)setupTabBar {
    
    BTTabBar *tabBar = [[BTTabBar alloc] init];
    
    tabBar.backgroundImage = [UIImage imageNamed:@"tab_bar_bg_15x50_"];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
}



#pragma mark - 添加所有子控制器
- (void)setupAllChildVC {
    
    // 首页
    BTHomeViewController *homeVC = [[BTHomeViewController alloc] init];
    [self setupOneChildVC:homeVC image:@"tab_首页_24x24_" selectedImage:@"tab_首页_pressed_24x24_" title:nil];
    
    // 发现
    BTDiscoverViewController *discoverVC = [[BTDiscoverViewController alloc] init];
    [self setupOneChildVC:discoverVC image:@"tab_社区_26x26_" selectedImage:@"tab_社区_pressed_26x26_" title:nil];
    
    // 消息
    BTMessageViewController *messageVC = [[BTMessageViewController alloc] init];
    [self setupOneChildVC:messageVC image:@"tab_分类_27x21_" selectedImage:@"tab_分类_pressed_27x21_" title:@"消息"];
    
    // 账号
    BTAccountViewController *accountVC = [[BTAccountViewController alloc] init];
    [self setupOneChildVC:accountVC image:@"tab_我的_22x23_" selectedImage:@"tab_我的_pressed_22x23_" title:@"👄"];
    
}


#pragma mark - 设置子控制器
- (void)setupOneChildVC:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    BTNavigationController *nav = [[BTNavigationController alloc] initWithRootViewController:vc];
    
    vc.navigationItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    [self addChildViewController:nav];
    
}

@end
