//
//  PaidNewsFrameModel.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/9.
//  Copyright © 2018年 co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaidNewsFrameModel : NSObject

@property (nonatomic,assign)CGRect cellTitleFrame;
@property (nonatomic,assign)CGRect moreFrame;
@property (nonatomic,assign)CGRect backScrollViewFrame;
@property (nonatomic,strong)NSMutableArray *paidNewsViewFrames;
@property (nonatomic,strong)NSMutableArray *paidTitleFrames;
@property (nonatomic,strong)NSMutableArray *avatorFrames;
@property (nonatomic,strong)NSMutableArray *nickNameFrames;
@property (nonatomic,strong)NSMutableArray *updateInfoFrames;

+(instancetype)PaidNewsFrameModelWithCount:(NSInteger)count;
@end
