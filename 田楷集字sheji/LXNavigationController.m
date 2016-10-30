//
//  LXNavigationController.m
//  田楷集字sheji
//
//  Created by lixue on 16/8/30.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "LXNavigationController.h"

@implementation LXNavigationController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setupNavigationBar];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupNavigationBar];
    }
    return self;
}
-(void)setupNavigationBar{
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:250/255.0 green:67/255.0 blue:129/255.0 alpha:1.0]];
    /**
     设置状态栏背景颜色
     */
    UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0,-20, [[UIScreen mainScreen]bounds].size.width, 20)];
    statusBarView.backgroundColor   = [UIColor colorWithRed:202/255.0 green:54
                                       /255.0 blue:104/255.0 alpha:1.0];
    [self.navigationBar addSubview:statusBarView ];
    self.title = @"田楷集字系统";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20.0];
    dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:dic];

}
@end
