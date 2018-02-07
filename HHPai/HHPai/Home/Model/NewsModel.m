//
//  NewsModel.m
//  HHPai
//
//  Created by 恒 韩 on 2018/2/7.
//  Copyright © 2018年 co. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+(instancetype)newsModelWithDic:(NSDictionary *)dic{
    NewsModel *newsModel = [[NewsModel alloc]init];
    newsModel.title = dic[@"title"];
    newsModel.banner = dic[@"banner"];
    newsModel.summary = dic[@"promote_intro"];
    newsModel.like_total = dic[@"like_total"];
    newsModel.comment_total = dic[@"comment_total"];
    newsModel.released_at =dic[@"released_at"];
    NSMutableDictionary *author = dic[@"author"];
    newsModel.avator = author[@"avatar"];
    newsModel.nickName = author[@"nickname"];
    newsModel.articleID = dic[@"id"];
    newsModel.cellHeight = 210 + kScreenWith * 0.3331;
    return newsModel;
}

@end
