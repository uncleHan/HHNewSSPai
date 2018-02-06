//
//  AdsCell.m
//  HHPai
//
//  Created by 恒 韩 on 2018/2/5.
//  Copyright © 2018年 co. All rights reserved.
//

#import "AdsCell.h"
#import <UIImageView+YYWebImage.h>
#import <CALayer+YYWebImage.h>
#import <UIImage+YYWebImage.h>

@interface AdsCell()
@property (nonatomic,weak)UIScrollView *scrollView;
@end

@implementation AdsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView adsModel:(AdsModel *)model{
    static NSString *identifier = @"adsCell";
    AdsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AdsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.adsModel = model;
        [cell setupUI];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (void)setupUI{
    UIScrollView *backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, (kScreenWith - 50) * 0.53125 + 40)];
    backScrollView.contentSize = CGSizeMake(self.adsModel.adsData.count * (kScreenWith - 40) + 40, 170);
    backScrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:backScrollView];
    
    for (int i = 0; i < self.adsModel.adsData.count; i ++) {
        UIView *shadowView = [[UIView alloc]init];
        shadowView.frame = CGRectMake(25 + (kScreenWith - 40) * i, 15, kScreenWith - 50, (kScreenWith - 50) * 0.53125);
        shadowView.layer.shadowColor = [UIColor greenColor].CGColor;//阴影颜色
        shadowView.layer.shadowRadius = 5.0;//阴影半径
        shadowView.layer.shadowOpacity = 1;//阴影透明度
        shadowView.layer.shadowOffset = CGSizeMake(-4, 4);//阴影的偏移量
        shadowView.userInteractionEnabled = YES;
        shadowView.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(adsViewDidSelected:)];
        [shadowView addGestureRecognizer:tap];
        
        [backScrollView addSubview:shadowView];
        
        CALayer *adsLayer = [[CALayer alloc]init];
        adsLayer.frame = CGRectMake(0, 0, kScreenWith - 50, (kScreenWith - 50) * 0.53125);
        [adsLayer yy_setImageWithURL:[NSURL URLWithString:self.adsModel.adsData[i][@"image"]] placeholder:nil options:kNilOptions progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
            image = [image yy_imageByRoundCornerRadius:5.0];
            return image;
        } completion:nil];
        
        [shadowView.layer addSublayer:adsLayer];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
