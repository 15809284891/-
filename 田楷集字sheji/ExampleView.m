//
//  ExampleView.m
//  田楷集字sheji
//
//  Created by lixue on 16/8/30.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "ExampleView.h"
#import "UIView+LXExtension.h"
#import "myLableView.h"
@interface ExampleView()<myLableViewDelegate>
{
    int flag;
}

@property (nonatomic,weak)UIScrollView *scrollerView;@end

@implementation ExampleView
-(void)initExampleSubView{
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor  = [UIColor yellowColor ];
    [self addSubview:titleView];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    imageV.width = 25;
    imageV.height = imageV.width;
    imageV.x  = 15;
    imageV.y = (40-30)/2.0;
    titleView.userInteractionEnabled = YES;
    [titleView addSubview:imageV];
    
    UILabel *tipLb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+10, imageV.y, 100, imageV.height)];
    tipLb.text  = @"诗词名句";
    tipLb.font = [UIFont systemFontOfSize:15.0];
    tipLb.textColor = [UIColor darkGrayColor];
    [titleView addSubview:tipLb];
    int clos = 2;
    CGFloat marginX = 15;
    CGFloat y = 40;
    CGFloat width = (self.width-3*marginX)/clos*1.0;
    CGFloat height = self.height-y*2;
    UIScrollView *scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40+height, self.width, 40)];
    scrollerView.delegate = self;
    scrollerView.pagingEnabled = YES;
    scrollerView.contentSize = CGSizeMake(self.width*((self.examples.count)/2), 40);
    [self addSubview:scrollerView];
    self.scrollerView = scrollerView;
    for (int i = 0; i<2; i++) {
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.image = [UIImage imageNamed: [NSString stringWithFormat:@"0%d",i]];
        imageV.height = height;
        imageV.y = y;
        imageV.x = i*width+marginX*(i+1);
        imageV.width = width;
        [self addSubview:imageV];
          }
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame  = CGRectMake(self.width - 60, 5, 60, imageV.height);
    [moreButton setTitle:@"更多>" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    moreButton.titleLabel .font = [UIFont systemFontOfSize:15.0];
    [self addSubview:moreButton];
    [self scrollViewDidEndScrollingAnimation:self.scrollerView];
    
}
-(void)setExamples:(NSArray *)examples{
    _examples = examples;
}
-(void)click:(UIButton *)sender{
    [self.delegate moreClick:sender];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = (scrollView.contentOffset.x)/scrollView.width;
    for (myLableView *lableView in scrollView.subviews) {
        [lableView removeFromSuperview];
    }
    myLableView *lableView = [ [myLableView  alloc]initWithFrame:CGRectMake(index*scrollView.width, 0, scrollView.width, 40)];
    lableView.delegate = self;
    lableView.results = [NSMutableArray array];
        int tempflag = flag+1;
        for (int i= tempflag ; i<2+tempflag; i++) {
            if (flag < self.examples.count) {
                [lableView.results addObject:self.examples[i]];
                flag = i;
            }
            else{
                flag = 0;
            }
    
        }
    [lableView setupLable];
    [scrollView addSubview:lableView];

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
-(void)changeText:(NSString *)text{
    [self.delegate setLableText:text];
}
@end
