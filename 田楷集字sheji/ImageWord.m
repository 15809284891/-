//
//  ImageWord.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/8.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "ImageWord.h"
#import "MJExtension.h"
@implementation ImageWord
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ImageChar":@"char",
             @"ImageChar_ID":@"char_id"
             };
}
@end
