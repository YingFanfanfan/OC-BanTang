//
//  BTOrderCell.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/31.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTOrderCell.h"

@implementation BTOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    
    frame.size.height -= 1;
    [super setFrame:frame];
}


@end
