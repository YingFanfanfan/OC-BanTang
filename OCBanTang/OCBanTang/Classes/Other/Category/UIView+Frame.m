//
//  UIView+Frame.m
//  BaiSi
//
//  Created by 黄颖帆 on 16/4/25.
//  Copyright © 2016年 黄颖帆. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)hyf_x {
    return self.frame.origin.x;
}

- (void)setHyf_x:(CGFloat)hyf_x {
    CGRect frame = self.frame;
    frame.origin.x = hyf_x;
    self.frame = frame;
}

- (CGFloat)hyf_y {
    return self.frame.origin.y;
}

- (void)setHyf_y:(CGFloat)hyf_y {
    CGRect frame = self.frame;
    frame.origin.y = hyf_y;
    self.frame = frame;
}

- (CGFloat)hyf_w {
    return self.frame.size.width;
}

- (void)setHyf_w:(CGFloat)hyf_w {
    CGRect frame = self.frame;
    frame.size.width = hyf_w;
    self.frame = frame;
}

- (CGFloat)hyf_h {
    return self.frame.size.height;
}

- (void)setHyf_h:(CGFloat)hyf_h {
    CGRect frame = self.frame;
    frame.size.height = hyf_h;
    self.frame = frame;
}

@end
