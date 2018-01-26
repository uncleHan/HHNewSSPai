//
//  HomeViewController.m
//  HHPai
//
//  Created by 恒 韩 on 2017/12/25.
//  Copyright © 2017年 co. All rights reserved.
//

#import "HomeViewController.h"
#import "HHHeaderView.h"

@interface HomeViewController ()
<HHHeaderViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic,strong)HHHeaderView *headerView;
@property (nonatomic,strong)UIScrollView *backGroudScrollView;
@property (nonatomic,strong)UITableView *tableView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //初始化北京scrollView
    self.backGroudScrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.backGroudScrollView];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cello";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
