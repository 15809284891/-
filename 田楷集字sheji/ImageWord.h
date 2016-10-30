//
//  ImageWord.h
//  田楷集字sheji
//
//  Created by lixue on 16/9/8.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageWord : NSObject
/** 图片 */
@property (nonatomic,copy)NSString *c_images;
/** 编码 */
@property (nonatomic,copy)NSString *ImageChar;
/** 编码ID */
@property (nonatomic,copy)NSString *ImageChar_ID;

@end
