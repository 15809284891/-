//
//  MYTitleView.h
//  田楷集字sheji
//
//  Created by lixue on 16/9/9.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MYTitleViewDelegate <NSObject>
@optional
-(void)push;
-(void)setInputText:(NSString *)text;
@end
@interface MYTitleView : UIView
@property(nonatomic,weak)id<MYTitleViewDelegate>delegate;
@end
