//
//  VerticalButton.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/7.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "VerticalButton.h"

@implementation VerticalButton
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, 30, 30);
    self.imageView.frame = CGRectMake(30, 0, self.frame.size.width-30, self.frame.size.width-30);
}
@end
