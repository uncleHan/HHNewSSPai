//
//  HHTabBarViewController.m
//  HHPai
//
//  Created by 恒 韩 on 2018/1/18.
//  Copyright © 2018年 co. All rights reserved.
//

#import "HHTabBarViewController.h"
#import "HomeViewController.h"
#import "FoundViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "HHNaVViewController.h"

@interface HHTabBarViewController ()

@end

@implementation HHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)initTabBar{
    //主页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self initNavWithRootViewController:homeVC withImage:[UIImage imageNamed:@"home_26x23_"] selectedImage:[UIImage imageNamed:@"home_pressed_26x23_"]];
    //发现
    FoundViewController *foundVC = [[FoundViewController alloc]init];
    [self initNavWithRootViewController:foundVC withImage:[UIImage imageNamed:@"discover_18x24_"] selectedImage:[UIImage imageNamed:@"discover_pressed_18x24_"]];
    //信息
    MessageViewController *messagePage = [[MessageViewController alloc] init];
    [self initNavWithRootViewController:messagePage withImage:[UIImage imageNamed:@"notification_20x24_"] selectedImage:[UIImage imageNamed:@"notification_pressed_20x24_"]];
    
    //我的
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self initNavWithRootViewController:mineVC withImage:[UIImage imageNamed:@"user_20x24_"] selectedImage:[UIImage imageNamed:@"user_pressed_20x24_"]];
}


- (void)initNavWithRootViewController:(UIViewController *)rootViewController withImage:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    HHNaVViewController *nav = [[HHNaVViewController alloc]initWithRootViewController:rootViewController];
    [nav.tabBarItem setImage:image];
    [nav.tabBarItem setSelectedImage:image];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [self addChildViewController:nav];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
