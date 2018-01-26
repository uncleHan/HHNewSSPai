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

#pragma mark lazyInit
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(25);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(-10);
            make.height.mas_equalTo(36);
            make.width.mas_equalTo(120);
        }];
    }
    [self addSubview:_titleLabel];
    return _titleLabel;
}

- (UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]init];
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).with.offset(-25);
            make.bottom.mas_equalTo(self.mas_bottom).width.offset(-15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
    }
    [self addSubview:_button];
    return _button;
}

@end
