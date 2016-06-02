//
//  BTNavigationController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTNavigationController.h"

@interface BTNavigationController ()

@end

@implementation BTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        
        // 创建全局返回按钮
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [backBtn setImage:[UIImage imageNamed:@"public_back_btn_44x44_"] forState:UIControlStateNormal];
        
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [backBtn sizeToFit];
        
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        // push之后底部tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)backBtnClick {
    
    [self popViewControllerAnimated:YES];
}


@end
