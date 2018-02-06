//
//  AdsModel.m
//  HHPai
//
//  Created by 恒 韩 on 2018/2/5.
//  Copyright © 2018年 co. All rights reserved.
//
#import "AdsModel.h"

@implementation AdsModel

+ (instancetype)AdsModelWithArr:(NSArray *)arr{
    AdsModel *adsModel = [[AdsModel alloc]init];
    adsModel.adsData = arr;
    adsModel.cellHeight = (kScreenWith - 50) * 0.53125 + 40;
    return adsModel;
}

@end
