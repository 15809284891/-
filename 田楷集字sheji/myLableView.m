//
//  myLableView.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/9.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "myLableView.h"
#import "UIView+LXExtension.h"
@implementation myLableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}
-(void)setupLable{
    int clos = 2;
    CGFloat marginX = 15;
    CGFloat y  = 0;
    CGFloat width = (self.width-3*marginX)/clos*1.0;
    CGFloat height = self.height;
    for (int i = 0; i<2; i++) {
        UILabel *lable = [[UILabel alloc] init];
        lable.width = width;
        lable.height = height;
        lable.y =y;
        lable.x =  i*width+marginX*(i+1);
        lable.text = self.results[i];
        lable.font = [UIFont systemFontOfSize:13.0];
        lable.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [lable addGestureRecognizer:tapGesture];
        lable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lable];
    }

}
-(void)click:( UITapGestureRecognizer   *)tapGesture{
    UILabel *lable = (UILabel *)tapGesture.view;
    NSLog(@"------%@",lable.text);
    [self.delegate changeText:lable.text];
}
@end
