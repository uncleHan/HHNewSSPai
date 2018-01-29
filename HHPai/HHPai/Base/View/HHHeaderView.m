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
    //    scrollview刚刚开始滑动，此时导航标题大小和按钮大小进行变化
//    if (Y <= -97 && Y > -130)
//    {
//        //            以字号为36和20计算得出的临界Y值为-97和-130，根据此刻Y值计算此时的字号
//        CGFloat fontSize = (-((16.0 * Y)/33.0)) - 892.0/33.0;
//        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize];
//        //            NSLog(@"point:: %f",self.titleLabel.font.pointSize);
//        //            更新titlelabel的高度约束
//        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(self.titleLabel.font.pointSize + 0.5);
//        }];
//        //            计算此刻button的对应尺寸，若大于最小值（16），则更新约束
//        CGFloat buttonSize = self.titleLabel.font.pointSize * (5.0/9.0);
//        if (buttonSize >= 16.0)
//            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.width.mas_equalTo(buttonSize);
//                make.height.mas_equalTo(buttonSize);
//            }];
//    }
//    //    此时控件大小不变，headview的frame进行变化，表现为控件上下平行移动。临界条件为高度等于系统导航条高度（64）
//    if (Y > -97 && Y <= -61)
//    {
//        //            ！！！此处非常诡异。测试时，控件向上平行移动时是正常的。但是在控件向下平行移动时，若不将代码放在主线程中执行，frame的更新是无效的，控件不会下滑。此处待探究原因。
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.frame = CGRectMake(0, 0, kScreenWith, 3 - Y);
//        });
//    }
//    //    防止计算无法精确到整数，控件尺寸在临界条件跳变，作此处理
//    if (Y < -130)
//    {
//        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:36.0];
//        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(36.0);
//        }];
//        [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(20.0);
//            make.height.mas_equalTo(20.0);
//        }];
//        //            模拟导航条控件也在scrollview上的效果
//        self.frame = CGRectMake(0, 0, kScreenWith, 100 + ((-130) - Y));
//    }
//    //    防止滑动过快时，导航栏控件没有正确缩小尺寸，作此处理
//    if (Y > - 97)
//    {
//        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
//        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(20.0);
//        }];
//        [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(16.0);
//            make.height.mas_equalTo(16.0);
//        }];
//        self.frame = CGRectMake(0, 0, kScreenWith, 64);
//    }
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
