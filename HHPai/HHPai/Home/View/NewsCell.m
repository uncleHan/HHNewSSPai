//
//  NewsCell.m
//  HHPai
//
//  Created by 恒 韩 on 2018/2/7.
//  Copyright © 2018年 co. All rights reserved.
//

#import "NewsCell.h"
#import <CALayer+YYWebImage.h>
#import <UIImage+YYWebImage.h>

@interface NewsCell()

@property (nonatomic,weak)CALayer *avator;//头像
@property (nonatomic,weak)UILabel *nickName;//昵称
@property (nonatomic,weak)UIButton *menu;//"更多"按钮
@property (nonatomic,weak)CALayer *banner;//横幅
@property (nonatomic,weak)UILabel *articleTitle;//标题
@property (nonatomic,weak)UILabel *rmdDescription;//描述
@property (nonatomic,weak)UIImageView *likeIcon;//点赞图标
@property (nonatomic,weak)UILabel *likeAndComment;//点赞数
@property (nonatomic,weak)UILabel *postTime;//发布时间

@end



@implementation NewsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView NewsModel:(NewsModel *)model{
    static NSString *identifier = @"newsIdentifier";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setupUI];
    }
    cell.newsModel = model;//给cell的内容赋值
    return cell;
}

- (void)setupUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //用户头像
    CALayer *avator = [[CALayer alloc]init];
    avator.frame = CGRectMake(25, 15, 30, 30);
    [self.contentView.layer addSublayer:avator];
    self.avator = avator;
    
    //昵称
    UILabel *nickName = [[UILabel alloc]init];
    nickName.frame = CGRectMake(65, 22.5, 150, 15);
    [self.contentView addSubview:nickName];
    nickName.textAlignment = NSTextAlignmentLeft;
    nickName.font = [UIFont systemFontOfSize:14.0];
    nickName.textColor = UIColor(102, 102, 102);
    
    self.nickName = nickName;
    
    //"更多"按钮
    UIButton *menuButton = [[UIButton alloc]init];
    [self.contentView addSubview:menuButton];
    [menuButton setImage:[UIImage imageNamed:@"more_18x4_"] forState:UIControlStateNormal];
    [menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-25);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(17.5);
        make.width.and.height.mas_equalTo(25);
    }];
    self.menu = menuButton;
    
    //横幅
    CALayer *banner = [[CALayer alloc]init];
    [self.contentView.layer addSublayer:banner];
    banner.frame = CGRectMake(25, 55, kScreenWith - 50, (kScreenWith - 50) * 0.3331);
    self.banner = banner;
    //标题
    UILabel *tittle = [[UILabel alloc]init];
    tittle.textAlignment = NSTextAlignmentLeft;
    tittle.font = [UIFont systemFontOfSize:20.0];
    tittle.textColor = [UIColor blackColor];
    tittle.numberOfLines = 0;
    tittle.preferredMaxLayoutWidth = kScreenWith - 50;
    [tittle setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.contentView addSubview:tittle];
    [tittle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).with.offset(25);
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-25);
        make.top.mas_equalTo(self.contentView.mas_top).with.offset(70 + (kScreenWith - 50) * 0.3331);
    }];
    self.articleTitle = tittle;
    //描述
    UILabel *articleDes = [[UILabel alloc]init];
    [self.contentView addSubview:articleDes];
    self.rmdDescription = articleDes;
    articleDes.textAlignment = NSTextAlignmentLeft;
    articleDes.font = [UIFont systemFontOfSize:14.0];
    articleDes.numberOfLines = 0;
    articleDes.preferredMaxLayoutWidth = kScreenWith - 50;
    [articleDes setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    articleDes.textColor = UIColor(170, 170, 170);
    [articleDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(tittle);
        make.top.mas_equalTo(tittle.mas_bottom).with.offset(10);
    }];
    //点赞图标
    UIImageView *likeImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:likeImageView];
    self.likeIcon = likeImageView;
    [likeImageView setImage:[UIImage imageNamed:@"like_20x17_"]];
    [likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(articleDes.mas_left);
        make.top.mas_equalTo(articleDes.mas_bottom).with.offset(12);
        make.width.mas_equalTo(14.0);
        make.height.mas_equalTo(11.9);
    }];
    //点赞数
    UILabel *likeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:likeLabel];
    self.likeAndComment = likeLabel;
    likeLabel.textAlignment = NSTextAlignmentLeft;
    likeLabel.font = [UIFont systemFontOfSize:12.0];
    likeLabel.textColor = UIColor(107, 107, 107);
    [likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(likeImageView.mas_right).with.offset(8);
        make.top.mas_equalTo(articleDes.mas_bottom).with.offset(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(14);
    }];
    //发布时间
    UILabel *postLabel = [[UILabel alloc]init];
    [self.contentView addSubview:postLabel];
    self.postTime = postLabel;
    postLabel.font = [UIFont systemFontOfSize:12.0];
    postLabel.textAlignment = NSTextAlignmentRight;
    postLabel.textColor = UIColor(208, 208, 208);
    [postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-25);
        make.top.mas_equalTo(articleDes.mas_bottom).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(14);
    }];
}

- (void)setNewsModel:(NewsModel *)newsModel{
    _newsModel = newsModel;
    
   // #import <CALayer+YYWebImage.h>
    [self.avator yy_setImageWithURL:[NSURL URLWithString:newsModel.avator] placeholder:nil options:kNilOptions progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        //#import <UIImage+YYWebImage.h>
        image = [image yy_imageByRoundCornerRadius:60.0];
        return image;
    } completion:nil];
    
    self.nickName.text = newsModel.nickName;//昵称
    self.articleTitle.text = newsModel.title;//标题
    //横幅
    [self.banner yy_setImageWithURL:[NSURL URLWithString:newsModel.banner] placeholder:nil options:kNilOptions manager:nil progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        image = [image yy_imageByRoundCornerRadius:5.0];
        return image;
    } completion:nil];
    //描述
    if ((float)newsModel.summary.length / kScreenWith > 0.11) {
        NSString *temStr = [newsModel.summary substringToIndex:(int)kScreenWith * 0.11];
        newsModel.summary = [temStr stringByAppendingString:@"..."];
    }
    self.rmdDescription.text = newsModel.summary;
    //点赞数
    self.likeAndComment.text = [NSString stringWithFormat:@"%@ · %@评论",newsModel.like_total,newsModel.comment_total];
    //发布时间
    self.postTime.text = @"20小时前";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
