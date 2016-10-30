//
//  MYCollectionView.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/10.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "MYCollectionView.h"
#import "UIImageView+WebCache.h"
#import "ImageWord.h"
#import "UIView+LXExtension.h"
@implementation MYCollectionView
static NSString *const cellID = @"cellID";
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self= [super initWithFrame:frame collectionViewLayout:layout]) {
            [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"-------%ld",self.results.count);
    return self.results.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    for (UIImageView *imageV in cell.contentView.subviews) {
        [imageV removeFromSuperview];
    }
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(1, 1, cell.frame.size.width-2, cell.frame.size.height-2)];
    ImageWord *imageWord = self.results[indexPath.row];
    [imageV  sd_setImageWithURL:[NSURL URLWithString:imageWord.c_images]];
    imageV.backgroundColor = [UIColor whiteColor];
    [cell.contentView  addSubview:imageV];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return (CGSize){(self.width-50)/3.0,(self.width-50)/3.0};
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0,0, 0);
}
@end
