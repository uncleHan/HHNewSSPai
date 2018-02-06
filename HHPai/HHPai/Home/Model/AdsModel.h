//
//  AdsModel.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/5.
//  Copyright © 2018年 co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdsModel : NSObject

@property (nonatomic,strong)NSArray *adsData;
@property (nonatomic,assign)CGFloat cellHeight;

+(instancetype)AdsModelWithArr:(NSArray *)arr;

@end
