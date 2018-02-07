//
//  NewsModel.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/7.
//  Copyright © 2018年 co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,strong)NSString *title;//标题
@property (nonatomic,strong)NSString *summary;//简述
@property (nonatomic,strong)NSString *nickName;//昵称
@property (nonatomic,strong)NSString *avator;//作者
@property (nonatomic,strong)NSString *banner;//横幅
@property (nonatomic,strong)NSString *comment_total;//评论
@property (nonatomic,strong)NSString *like_total;//点赞
@property (nonatomic,strong)NSString *released_at;//发布时间
@property (nonatomic,strong)NSString *articleID;//文章id
@property (nonatomic,assign)CGFloat cellHeight;//高度

+ (instancetype)newsModelWithDic:(NSDictionary *)dic;
@end
