//
//  HHHeaderView.m
//  HHPai
//
//  Created by 恒 韩 on 2018/1/24.
//  Copyright © 2018年 co. All rights reserved.
//

#import "HHHeaderView.h"

@interface HHHeaderView()

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIButton *button;

@end

@implementation HHHeaderView


- (instancetype)initWithTitle:(NSString *)title button:(NSString *)button{
    self = [super init];
    self.frame = CGRectMake(0, 0, kScreenWith, 100);
    self.titleLabel.text = title;
    if (button) {
        [self.button setImage:[UIImage imageNamed:button] forState:UIControlStateNormal];
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}



- (void)buttonClicked:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ButtonClicked)]) {
        [self.delegate ButtonClicked];
    }
}


- (void)viewScrollByY:(float)Y{
    //第一阶段 -130 < y <= -97  此阶段是标题放大和缩小的阶段
    if (Y > -130 && Y <= -97) {
        CGFloat fontSize = -16/33.0 * Y - 892/33.0;
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize];
        //更新titleLabel的高度约束
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.titleLabel.font.pointSize + 0.5);
        }];
//        NSLog(@"字体大小:%f",self.titleLabel.font.pointSize);
        //如果字体大小>16,则更新button的尺寸
        CGFloat buttonSize = self.titleLabel.font.pointSize * (5.0/9.0);
        if (buttonSize >= 16.0) {
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(buttonSize);
                make.height.mas_equalTo(buttonSize);
            }];
        }
        //
    }
    if (Y > -97 && Y <= -61){
        //在这一小段范围内,控制headerview的高度递增和递减
        //原文遇到必须在主线程才能更新frame的问题,不知为何,我没遇到
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.frame = CGRectMake(0, 0, kScreenWith, 3 - Y);
//        });
        self.frame = CGRectMake(0, 0, kScreenWith, 3 - Y);
    }
    if (Y < -130){
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(36.0);
        }];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(20.0);
            make.height.mas_equalTo(20.0);
        }];
        self.frame = CGRectMake(0, 0, kScreenWith, 100 + (-130) - Y);
    }
    if (Y > -61){
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20.0);
        }];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(16.0);
            make.height.mas_equalTo(16.0);
        }];
        self.frame = CGRectMake(0, 0, kScreenWith, 64);
    }
}

#pragma mark lazyInit
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(25);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(-10);
            make.height.mas_equalTo(36);
            make.width.mas_equalTo(120);
        }];
    }
    return _titleLabel;
}

- (UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]init];
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).with.offset(-25);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(-15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
    }
    return _button;
}

@end
