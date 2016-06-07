//
//  BTDiscoverViewController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTDiscoverViewController.h"
#import "UIBarButtonItem+Item.h"
#import "BTListViewController.h"
#import "BTDanPinViewController.h"

@interface BTDiscoverViewController ()

@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) UIButton *listBtn;
@property (nonatomic, weak) UIButton *danpinBtn;
@property (nonatomic, weak) UIView *redLine;

@end

@implementation BTDiscoverViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条按钮
    [self setupNavButton];
    
    // 设置导航条中间内容view
    [self addNavMiddleContentView];
    
    
    // 添加所以子控制器
    [self addAllChildVC];
    
    [self addChildVC:0];
    
}


#pragma mark - 添加子控制器
- (void)addAllChildVC {
    
    BTListViewController *listVC = [[BTListViewController alloc] init];
    listVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:listVC];
    
    
    BTDanPinViewController *danpinVC = [[BTDanPinViewController alloc] init];
    danpinVC.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:danpinVC];
    
}

#pragma mark - 根据索引添加相应子控制器
- (void)addChildVC:(NSInteger)index {
    
    [self.view.subviews.lastObject removeFromSuperview];
    
    UIViewController *vc = self.childViewControllers[index];
    
    vc.view.frame = CGRectMake(0, 0, vc.view.hyf_w, vc.view.hyf_h);
    
    [self.view addSubview:vc.view];
    
}




#pragma mark - 设置导航条中间内容view(添加清单. 单品按钮)
- (void)addNavMiddleContentView {
    
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(0, 0, 130, 44);
//    contentView.backgroundColor = [UIColor yellowColor];
    
    // 添加两个按钮
    /*
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(67.5, 0, 57.5, 44);
    [listBtn setTitle:@"清单" forState:UIControlStateNormal];
    [listBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [listBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    listBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    listBtn.selected = YES;
    [listBtn addTarget:self action:@selector(listBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [contentView addSubview:listBtn];
    */
    
    UIButton *listBtn = [self addButtonWith:@"清单" rect:CGRectMake(5, 0, 57.5, 44)];
    
    [listBtn addTarget:self action:@selector(listBtnClick) forControlEvents:UIControlEventTouchUpInside];
    listBtn.selected = YES;
    _listBtn = listBtn;
    
    [contentView addSubview:listBtn];
    
    
    UIButton *danpinBtn = [self addButtonWith:@"单品" rect:CGRectMake(67.5, 0, 57.5, 44)];
    
    [danpinBtn addTarget:self action:@selector(danpinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _danpinBtn = danpinBtn;
    
    [contentView addSubview:danpinBtn];
    
    // 添加中间分割线
    UIView *middleLine = [[UIView alloc] init];;
    middleLine.backgroundColor = [UIColor lightGrayColor];
    middleLine.alpha = 0.6;
    middleLine.frame = CGRectMake(contentView.hyf_w * 0.5, 13, 1, 15);

    [contentView addSubview:middleLine];
    
    // 添加下划线
    UIView *redLine = [[UIView alloc] init];
    redLine.backgroundColor = [UIColor redColor];
    redLine.hyf_w = listBtn.hyf_w - 20;
    redLine.hyf_h = 2;
    redLine.hyf_center_x = listBtn.hyf_center_x;
    redLine.hyf_y = contentView.hyf_h - redLine.hyf_h;
    [contentView addSubview:redLine];
    
    _redLine = redLine;
    
    _contentView = contentView;
    self.navigationItem.titleView = contentView;
}


#pragma mark - 添加一个按钮
- (UIButton *)addButtonWith:(NSString *)title rect:(CGRect)rect {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    return btn;
    
}


#pragma mark - 监听清单单品按钮点击
- (void)listBtnClick {
    
    NSLog(@"点击了清单按钮");
    
    _listBtn.selected = YES;
    _danpinBtn.selected = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        _redLine.hyf_center_x = _listBtn.hyf_center_x;
    }];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"discover_write_article_icon_18x20_"] highlightImage:nil Target:self action:@selector(writeBtnClick)];
    
    [self addChildVC:0];
    
}

- (void)danpinBtnClick {
    
    NSLog(@"点击了单品按钮");
    
    _danpinBtn.selected = YES;
    _listBtn.selected = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        _redLine.hyf_center_x = _danpinBtn.hyf_center_x;
    }];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"discovey_camera_btn_24x19_"] highlightImage:nil Target:self action:@selector(cameraBtnClick)];
    
    [self addChildVC:1];
}


#pragma mark - 设置导航条按钮
- (void)setupNavButton {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"discovey_pop_btn_20x20_"] highlightImage:[UIImage imageNamed:@"discovey_pop_press_btn_20x20_"] Target:self action:@selector(leftBtnClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"discover_write_article_icon_18x20_"] highlightImage:nil Target:self action:@selector(writeBtnClick)];
}


#pragma mark - 监听导航条按钮点击
- (void)leftBtnClick {
    NSLog(@"点击了左侧按钮");
}

- (void)writeBtnClick {
    NSLog(@"点击了发布按钮");
}

- (void)cameraBtnClick {
    NSLog(@"点击了相机按钮");
}

@end
