//
//  PaidNewsModel.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/8.
//  Copyright © 2018年 co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaidNewsModel : NSObject

@property (nonatomic,strong)NSArray *paidNewsData;



+ (instancetype)paidNewsModelWithDic:(NSDictionary *)dic;

@end
