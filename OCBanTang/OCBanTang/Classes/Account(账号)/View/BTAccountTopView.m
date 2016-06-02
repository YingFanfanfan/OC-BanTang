//
//  BTAccountTopView.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/6/1.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTAccountTopView.h"

@interface BTAccountTopView()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@end

@implementation BTAccountTopView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //用户头像圆角处理
    self.userIcon.layer.cornerRadius = self.userIcon.frame.size.width * 0.5;
    self.userIcon.layer.masksToBounds = YES;
}

@end
