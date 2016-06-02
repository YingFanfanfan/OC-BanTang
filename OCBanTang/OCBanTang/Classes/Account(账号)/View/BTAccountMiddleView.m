//
//  BTAccountMiddleView.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/6/1.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTAccountMiddleView.h"

@interface BTAccountMiddleView()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redView;

@end

@implementation BTAccountMiddleView



#pragma mark - 监听各个按钮点击
- (IBAction)danpinClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.redView.constant = 0;
        [self layoutIfNeeded];
        
    }];
}

- (IBAction)qingdanClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.redView.constant = sender.hyf_w;
        [self layoutIfNeeded];
        
    }];
}

- (IBAction)fabuClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.redView.constant = sender.hyf_w * 2;
        [self layoutIfNeeded];
        
    }];
}

@end
