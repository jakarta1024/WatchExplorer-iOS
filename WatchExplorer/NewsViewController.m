//
//  NewsViewController.m
//  Watch
//
//  Created by scnfex on 12/10/12.
//
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
#import "NewsViewNewsCell.h"
//#import "HttpRequestManager.h"
#import "TKAlertCenter.h"
//#import "MBProgressHUD.h"
#import "NewsViewImageCell.h"
//#import "UIImageView+WebCache.h"
//#import "EGOCache.h"
#import "ASIHTTPRequest.h"

// size
#define kTableViewCellHeight 44
#define kImageViewHeight 200

@interface NewsViewController ()

@property (nonatomic, strong) UITableView *imageTableView;
@property (nonatomic, strong) UITableView *newsTableView;
@property (nonatomic, strong) NSArray *newsDatas;

- (void)loadCacheData;
- (void)loadData;

@end

@implementation NewsViewController


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.imageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kImageViewHeight)];
    [self.view addSubview:self.imageTableView];
    self.imageTableView.dataSource = self;
    self.imageTableView.delegate = self;
    self.imageTableView.scrollEnabled = NO;
    self.imageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.imageTableView.backgroundColor = [UIColor colorWithRed:30.0f / 255.0f
                                                           green:32.0f / 255.0f
                                                            blue:33.0f / 255.0f
                                                           alpha:1.0];

    self.newsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   kImageViewHeight,
                                                                   kScreenWidth,
                                                                   kScreenHeight - kImageViewHeight - kTabBarHeight)];
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
    [self.view addSubview:self.newsTableView];
    self.newsTableView.backgroundColor = [UIColor clearColor];
    self.newsTableView.showsVerticalScrollIndicator = NO;
    
    [self loadCacheData];
    
    [self loadData];
//    // demo
//    self.newsDatas = @[@{@"title" : @"高级珠宝", @"name":@"Dear Dior"}, @{@"title" : @"LADY DIOR网络纪录片", @"name":@"I. Fantasia"}, @{@"title" : @"腕表", @"name":@"Chiffre Rouge M05"}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCacheData {
    //NSArray *newslist = (NSArray *)[[EGOCache globalCache] objectForKey:@"newslist"];
    self.newsDatas = @[@""];
    [self.newsTableView reloadData];
    [self.imageTableView reloadData];
    
    [self.newsTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionNone];
}

- (void)loadData {
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[HttpRequestManager sharedManager] getNewsList:self
//                                          finishSel:@selector(getNewsListFinish:)
//                                            failSel:@selector(getNewsListFail:)];
}

- (void)getNewsListFinish:(ASIHTTPRequest *)request {
    NSString *responseString = [request responseString];
    NSLog(@"getNewsListFinish : %@", responseString);
    
//    SBJsonParser *parser = [[SBJsonParser alloc] init];
//    id results = [parser objectWithString:responseString];
//    NSLog(@"results : %@", results);
//    
//    NSString *returnCode = [results objectForKey:@"returnCode"];
//    if ([returnCode isEqualToString:@"1"]) {
//        NSArray *newslist = [[results objectForKey:@"outputData"] objectForKey:@"newslist"];
//        [[EGOCache globalCache] setObject:newslist forKey:@"newslist"];
//        
//        self.newsDatas = newslist;
        [self.newsTableView reloadData];
        [self.imageTableView reloadData];
        
        [self.newsTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                        animated:NO
                                  scrollPosition:UITableViewScrollPositionNone];
//    }
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)getNewsListFail:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"getNewsListFail : %@", [error description]);
    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"网络连接失败"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsDatas count]*100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *data = [self.newsDatas objectAtIndex:[indexPath row]%[self.newsDatas count]];
    
    if (tableView == self.newsTableView) {
        static NSString *NewsViewControllerNewsCellid = @"NewsViewControllerNewsCell";
        NewsViewNewsCell *cell = (NewsViewNewsCell *)[tableView dequeueReusableCellWithIdentifier:NewsViewControllerNewsCellid];
        if (!cell) {
            cell = [[NewsViewNewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:NewsViewControllerNewsCellid];
        }
        
        cell.text1.text = @"title";//[data objectForKey:@"title"];
        cell.text2.text = @"name";//[data objectForKey:@"name"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else {
        static NSString *NewsViewControllerImageCellid = @"NewsViewControllerImageCell";
        NewsViewImageCell *cell = (NewsViewImageCell *)[tableView dequeueReusableCellWithIdentifier:NewsViewControllerImageCellid];
        if (!cell) {
            cell = [[NewsViewImageCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:NewsViewControllerImageCellid];
        }
        
        NSDictionary *data = [self.newsDatas objectAtIndex:[indexPath row]%[self.newsDatas count]];
        [cell.image setImageWithURL:[NSURL URLWithString:@""]];        //[data objectForKey:@"thumbnailURL"]
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.newsTableView) {
        return kTableViewCellHeight;
    }
    else {
        return kImageViewHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsDetailViewController *controller = [[NewsDetailViewController alloc] init];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.newsTableView) {
        float scale = self.imageTableView.frame.size.height / kTableViewCellHeight;
        self.imageTableView.contentOffset = CGPointMake(0, self.newsTableView.contentOffset.y * scale);
        
        int row = self.newsTableView.contentOffset.y / kTableViewCellHeight;
        [self.newsTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionNone];
    }
}

@end
