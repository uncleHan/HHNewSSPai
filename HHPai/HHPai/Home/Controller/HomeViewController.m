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
#import "AdsCell.h"
#import "NewsModel.h"
#import "NewsCell.h"



@interface HomeViewController ()
<HHHeaderViewDelegate,
UIScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource,
AdsCellDelegate,
NewsCellDelegate>

@property (nonatomic,strong)HHHeaderView *headerView;
@property (nonatomic,strong)UIScrollView *backGroudScrollView;
@property (nonatomic,strong)UITableView *tableView;

//data
@property (nonatomic,strong)NSMutableArray *adsData;
@property (nonatomic,strong)NSMutableArray *newsData;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
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

- (void)initData{
    //轮播图
    NSData *adsData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"adsData" ofType:@"json"]];
    NSDictionary *adsDic = [NSJSONSerialization JSONObjectWithData:adsData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *adsArray = adsDic[@"data"];
    AdsModel *adsModel = [AdsModel AdsModelWithArr:adsArray];
    [self.adsData addObject:adsModel];
    
    //新闻
    NSData *newsData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newsData" ofType:@"json"]];
    NSDictionary *newsDic = [NSJSONSerialization JSONObjectWithData:newsData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *newsArray = newsDic[@"data"];
    for (NSDictionary *dic in newsArray) {
        NewsModel *newsModel = [NewsModel newsModelWithDic:dic];
        [self.newsData addObject:newsModel];
    }
                        
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
    return self.adsData.count + self.newsData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AdsModel *adsModel = self.adsData[0];
        return adsModel.cellHeight;
    }else{
        NewsModel *newsModel = [self.newsData objectAtIndex:indexPath.row - 1];
    
        return newsModel.cellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AdsModel *adsModel = [self.adsData objectAtIndex:0];
        AdsCell *adsCell = [AdsCell cellWithTableView:tableView adsModel:adsModel];
        adsCell.delegate = self;
        return adsCell;
    }else{
//        NSString *identifier = @"default";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        return cell;
        NewsModel *newsModel = [self.newsData objectAtIndex:indexPath.row - 1];
        NewsCell *newsCell = [NewsCell cellWithTableView:tableView NewsModel:newsModel];
        newsCell.delegate = self;
        return newsCell;
    }
}

#pragma -- mark cellDelegate
- (void)adsCellTappedByTag:(NSInteger)tag{
    
}

- (void)menuButtonClickedWithID:(NSString *)articleID{
    
}

- (void)swipeLeft{
    
}

#pragma -- mark 懒加载
- (NSMutableArray *)adsData{
    if (!_adsData) {
        _adsData = [[NSMutableArray alloc]init];
    }
    return _adsData;
}

- (NSMutableArray *)newsData{
    if (!_newsData) {
        _newsData = [[NSMutableArray alloc]init];
    }
    return _newsData;
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
