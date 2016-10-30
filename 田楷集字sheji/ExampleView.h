//
//  ExampleView.h
//  田楷集字sheji
//
//  Created by lixue on 16/8/30.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myLableView;
@protocol ExampleViewDelegate <NSObject>
-(void)moreClick:(UIButton *)sender;
-(void)setLableText:(NSString *)text;
@end
@interface ExampleView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *examples;
@property(nonatomic,strong)NSMutableArray *results;
@property(nonatomic,weak)id<ExampleViewDelegate>delegate;
-(void)initExampleSubView;
@end
