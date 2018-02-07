//
//  NewsCell.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/7.
//  Copyright © 2018年 co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@protocol NewsCellDelegate <NSObject>

- (void)menuButtonClickedWithID:(NSString *)articleID;
- (void)swipeLeft;

@end

@interface NewsCell : UITableViewCell

@property (nonatomic,weak)id <NewsCellDelegate> delegate;
@property (nonatomic,strong)NewsModel *newsModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView NewsModel:(NewsModel *)model;

@end
