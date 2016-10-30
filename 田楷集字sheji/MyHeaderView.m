//
//  MyHeaderView.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/7.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "MyHeaderView.h"
#import "VerticalButton.h"
@implementation MyHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        VerticalButton *verticalBt = [VerticalButton buttonWithType:UIButtonTypeCustom];
        [verticalBt setTitle:@"字帖浏览" forState:UIControlStateNormal];
        [verticalBt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        verticalBt.backgroundColor  = [UIColor redColor];
        verticalBt.frame = CGRectMake(0, 0, 100, 20);
        [self addSubview:verticalBt];
    }
    return self;
}
@end
