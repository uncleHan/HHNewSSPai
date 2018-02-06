//
//  HHHeaderView.h
//  HHPai
//
//  Created by 恒 韩 on 2018/1/24.
//  Copyright © 2018年 co. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HHHeaderViewDelegate <NSObject>

@optional
- (void)ButtonClicked;

@end

@interface HHHeaderView : UIView

@property (nonatomic,weak)id<HHHeaderViewDelegate> delegate;

//button可为空的初始化方法
- (instancetype)initWithTitle:(NSString *)title button:(nullable NSString *)button;
//通过scrollView的contentOffSet,Y值变化时,视图做相应变化
- (void)viewScrollByY:(float)Y;

- (void)messageViewScrollBySmallY:(float)Y;
@end
