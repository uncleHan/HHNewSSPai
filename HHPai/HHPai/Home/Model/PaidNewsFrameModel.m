//
//  PaidNewsFrameModel.m
//  HHPai
//
//  Created by 恒 韩 on 2018/2/9.
//  Copyright © 2018年 co. All rights reserved.
//

#import "PaidNewsFrameModel.h"

@implementation PaidNewsFrameModel

+ (instancetype)PaidNewsFrameModelWithCount:(NSInteger)count{
    PaidNewsFrameModel *model = [[self alloc]init];
    float cellWith = kScreenWith *0.55;
    float cellHeight = kScreenWith *0.7;
    model.cellTitleFrame = CGRectMake(25, 10, 100, 18);
    model.moreFrame = CGRectMake(kScreenWith - 50, 11, 40, 16);
    model.backScrollViewFrame = CGRectMake(0, 43, kScreenWith, cellHeight);
    model.paidNewsViewFrames = [[NSMutableArray alloc]init];
    model.paidTitleFrames = [[NSMutableArray alloc]init];
    model.avatorFrames = [[NSMutableArray alloc]init];
    model.nickNameFrames = [[NSMutableArray alloc]init];
    model.updateInfoFrames = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < count; i ++) {
        NSValue *paidNewsViewFrame = [NSValue valueWithCGRect:CGRectMake(25 + (cellWith + 15) * i, 0, cellWith, cellHeight)];
    }
    
    return model;
}

@end
