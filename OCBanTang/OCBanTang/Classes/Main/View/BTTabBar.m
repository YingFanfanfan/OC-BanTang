//
//  BTTabBar.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTTabBar.h"

@interface BTTabBar()

@property (nonatomic, weak) UIButton *photoBtn;

@end

@implementation BTTabBar

- (UIButton *)photoBtn {
    if (_photoBtn == nil) {
        
        UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [photoBtn setImage:[UIImage imageNamed:@"tab_publish_add_36x32_"] forState:UIControlStateNormal];
        [photoBtn setImage:[UIImage imageNamed:@"tab_publish_add_pressed_36x32_"] forState:UIControlStateHighlighted];
        
        _photoBtn = photoBtn;
        
        // 设置按钮自适应
        [photoBtn sizeToFit];
        
        // 添加按钮
        [self addSubview:photoBtn];
        
    }
    return _photoBtn;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
 
    
    NSInteger count = self.items.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = HYFScreenW / (count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    NSInteger i = 0;
    // 获取子控件, 重新布局
    for (UIView *tabBarBtn in self.subviews) {
        
        // 判断子控件类型
        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (i == 2) {
                i += 1;
            }
            
            btnX = i * btnW;
            
            tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            i++;
            
        }
        
    }
    
    self.photoBtn.center = CGPointMake(self.hyf_w * 0.5, self.hyf_h * 0.5);
}



@end
