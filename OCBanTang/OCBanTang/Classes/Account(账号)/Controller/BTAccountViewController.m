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
#import "BTAccountTopView.h"
#import "BTAccountMiddleView.h"

@interface BTAccountViewController ()

@property (nonatomic, strong) BTAccountTopView *topView;

@end

@implementation BTAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加导航栏两侧按钮
    [self setupNavBtn];
    
    [self setupTopView];
    [self setupMiddleView];
    
    
}

#pragma mark - 添加topView
- (void)setupTopView {
    
    BTAccountTopView *topView = [[[NSBundle mainBundle] loadNibNamed:@"BTAccountTopView" owner:self options:nil] firstObject];
    
    topView.frame = CGRectMake(0, 64, HYFScreenW, 131);
    
    _topView = topView;
    
    [self.view addSubview:topView];
    
}

- (void)setupMiddleView {
    
    BTAccountMiddleView *middleView = [[[NSBundle mainBundle] loadNibNamed:@"BTAccountMiddleView" owner:self options:nil] firstObject];
    
    middleView.frame = CGRectMake(0, _topView.hyf_h + 64, HYFScreenW, 44);
    
    [self.view addSubview:middleView];
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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BTOrderViewController" bundle:nil];
    
    BTOrderViewController *orderVC = [storyboard instantiateInitialViewController];
    
    [self.navigationController pushViewController:orderVC animated:YES];
    
    
}

- (void)settingBtnClick {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BTSettingViewController" bundle:nil];
    
    BTSettingViewController *settingVC = [storyboard instantiateInitialViewController];
    
    [self.navigationController pushViewController:settingVC animated:YES];
    
}


@end
