//
//  MYCollectionView.h
//  田楷集字sheji
//
//  Created by lixue on 16/9/10.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray * results;
@end
