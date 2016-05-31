//
//  BTSettingCell.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/31.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTSettingCell.h"
#import "UIView+Frame.h"

@implementation BTSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setFrame:(CGRect)frame {
    
    frame.origin.x += 10;
    
    frame.size.width -= 20;
    
    [super setFrame:frame];
    
}

@end
