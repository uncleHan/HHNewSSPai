//
//  HeaderView.h
//  HHPai
//
//  Created by 恒 韩 on 2017/12/25.
//  Copyright © 2017年 co. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HeaderViewDelegate <NSObject>

@optional
//headerView右侧按钮点击处理
- (void)rightBtnClicked;

@end

@interface HeaderView : UIView

@property (nonatomic,assign)id <HeaderViewDelegate> delegate;

- initWithTitle:(NSString *)title Button:(nullable NSString *)button;
//scrollView 滑动时headerview变化
- (void)viewScrollByOffSetY:(float)y;

@end
