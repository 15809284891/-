//
//  MyInputController.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/10.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "MyInputController.h"
#import "MYTitleView.h"
#import "MYCollectionView.h"
#import "UIView+LXExtension.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "VerticalButton.h"
#import "ImageWord.h"
#import "MJExtension.h"
@interface MyInputController()<MYTitleViewDelegate>
@property (nonatomic,weak)MYCollectionView*collectionView;
@property(nonatomic,strong)NSMutableArray *results;
@property(nonatomic,strong)NSArray *lines;
@property(nonatomic,weak)MYTitleView *titleView;
@end
@implementation MyInputController
-(NSMutableArray *)results{
    if (!_results) {
        NSMutableArray *array = [NSMutableArray array];
        _results = array;
    }
    return _results;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    [self setupTextView];
    [self setupCollectionView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StringInfo" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    self.lines  = [content componentsSeparatedByString:@"\n"];


}
-(void)setupTextView{
    MYTitleView *titleView = [[MYTitleView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, 50)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    titleView.delegate = self;
    self.titleView = titleView;

}
-(void)setupCollectionView{
    MYCollectionView*collectionView = [[MYCollectionView alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.titleView.frame)+20,0,0) collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    collectionView.x = 15;
    collectionView.y =CGRectGetMaxY(self.titleView.frame)+20;
    collectionView.width =  self.view.width-30;;
    collectionView.height = self.view.height - collectionView.y;
    collectionView.backgroundColor =[ UIColor whiteColor];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    VerticalButton *verticalBt = [VerticalButton buttonWithType:UIButtonTypeCustom];
    [verticalBt setTitle:@"字帖浏览" forState:UIControlStateNormal];
    [verticalBt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    verticalBt.backgroundColor  = [UIColor redColor];
    verticalBt.frame = CGRectMake(0, 0, 100, 20);
}

-(void)setInputText:(NSString *)text{
    NSMutableDictionary *paramas = [NSMutableDictionary dictionary];
    paramas[@"strs"] =text;
    [[AFHTTPSessionManager manager]POST: @"http://121.42.174.11:3000/index" parameters:paramas success:^(NSURLSessionDataTask *task, id responseObject) {
        self.results = [ImageWord objectArrayWithKeyValuesArray:responseObject[@"data"]];
        for (int  i = 0; i<self.results.count; i++) {
            ImageWord *tmp = self.results[i];
            if (tmp.c_images == nil) {
                [self.results removeObject:tmp];
            }
            self.collectionView.results = self.results;
        }
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];

}

@end
