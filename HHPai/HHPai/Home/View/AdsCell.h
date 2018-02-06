//
//  AdsCell.h
//  HHPai
//
//  Created by 恒 韩 on 2018/2/5.
//  Copyright © 2018年 co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdsModel.h"

@protocol AdsCellDelegate <NSObject>

@optional
- (void)adsCellTappedByTag:(NSInteger)tag;
@end

@interface AdsCell : UITableViewCell

@property (nonatomic,assign)id <AdsCellDelegate> delegate;
@property (nonatomic,strong)AdsModel *adsModel;

+(instancetype)cellWithTableView:(UITableView *)tableView adsModel:(AdsModel *)model;

@end
