//
//  myLableView.h
//  田楷集字sheji
//
//  Created by lixue on 16/9/9.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol myLableViewDelegate<NSObject>
-(void)changeText:(NSString *)text;
@end
@interface myLableView : UIView
@property(nonatomic,strong)NSMutableArray *results;
@property(nonatomic,weak)id<myLableViewDelegate>delegate;
-(void)setupLable;

@end
