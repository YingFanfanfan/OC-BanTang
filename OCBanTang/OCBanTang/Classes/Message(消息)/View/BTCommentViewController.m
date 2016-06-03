//
//  BTCommentViewController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/6/2.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTCommentViewController.h"


#define viewH HYFScreenH - 108

@interface BTCommentViewController ()

@property (nonatomic, weak) UIView *centerView;

@end

@implementation BTCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCenterView];
    
    [self setupCentent];
    
}


- (void)setupCenterView {
    
    UIView *centerView = [[UIView alloc] init];
    CGFloat w = 130;
    CGFloat h = 160;
    centerView.frame = CGRectMake((HYFScreenW - w) * 0.5 , (viewH - h) * 0.5 - 10, w, h);
    _centerView = centerView;
    
    [self.view addSubview:centerView];
    
    
}


- (void)setupCentent {
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_message_empty_127x127_"]];
    imageV.frame = CGRectMake(0, 0, 130, 130);
    [self.centerView addSubview:imageV];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"没有收到任何消息";
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:15];
    label.frame = CGRectMake(0, 140, 130, 10);
    
    [self.centerView addSubview:label];
}

@end
