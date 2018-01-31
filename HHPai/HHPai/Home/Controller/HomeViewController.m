//
//  HomeViewController.m
//  HHPai
//
//  Created by 恒 韩 on 2017/12/25.
//  Copyright © 2017年 co. All rights reserved.
//

#import "HomeViewController.h"
#import "HHHeaderView.h"
#import "MJRefresh.h"


@interface HomeViewController ()
<HHHeaderViewDelegate,
UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic,strong)HHHeaderView *headerView;
@property (nonatomic,strong)UIScrollView *backGroudScrollView;
@property (nonatomic,strong)UITableView *tableView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    //初始化背景scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:self.backGroudScrollView];
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollView.contentSize = CGSizeMake(kScreenWith, kScreenHeight + 1);
    [self.view insertSubview:scrollView atIndex:0];
    self.backGroudScrollView = scrollView;
    
    
    //tableView
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;//
//    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(130, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.backGroudScrollView addSubview:self.tableView];
    

    
    //
    MJRefreshHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 *NSEC_PER_SEC )), dispatch_get_main_queue(), ^{
            [self.backGroudScrollView.mj_header endRefreshing];
        });
    }];
    self.backGroudScrollView.mj_header = refreshHeader;
    
    
    //headerView
    self.headerView = [[HHHeaderView alloc]initWithTitle:@"首页" button:@"catalog_22x21_"];
    self.headerView.delegate = self;
    self.headerView.backgroundColor = [UIColor blueColor];
    [self.backGroudScrollView addSubview:self.headerView];
}


- (void)dropDownToRefresh{
    
}

#pragma -- mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        NSLog(@"tableView的contentOffset.y = %.f",scrollView.contentOffset.y);
    }else{
        NSLog(@"scrollView的contentOffset.y = %.f",scrollView.contentOffset.y);
    }
    [self.headerView viewScrollByY:scrollView.contentOffset.y];
}

#pragma -- mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cello";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor cyanColor];
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
