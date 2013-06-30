//
//  CommentListViewController.m
//  Watch
//
//  Created by scnfex on 1/31/13.
//
//

#import "CommentListViewController.h"
//#import "HttpRequestManager.h"
#import "NetworkClient.h"

@interface CommentListViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

- (void)loadData;
- (void)loadCacheData;

@end

@implementation CommentListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   kScreenWidth,
                                                                   kScreenHeight - kTitlebarHeight - kTabbarHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self loadCacheData];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCacheData {
    NSArray *commentList = (NSArray *)[[EGOCache globalCache] objectForKey:@"commentList"];
    self.datas = commentList;
    [self.tableView reloadData];
}

- (void)loadData{
    [[HttpRequestManager sharedManager] getCommentList:@"1"
                                              delegate:self
                                             finishSel:@selector(getCommentListFinish:)
                                               failSel:@selector(getCommentListFail:)];
}

- (void)getCommentListFinish:(ASIHTTPRequest *)request {
    NSString *responseString = [request responseString];
    NSLog(@"getCommentListFinish : %@", responseString);
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    id results = [parser objectWithString:responseString];
    NSLog(@"results : %@", results);
    
    NSString *returnCode = [results objectForKey:@"returnCode"];
    if ([returnCode isEqualToString:@"1"]) {
        NSArray *commentList = [[results objectForKey:@"outputData"] objectForKey:@"comments"];
        [[EGOCache globalCache] setObject:commentList forKey:@"commentList"];
        
        self.datas = commentList;
        [self.tableView reloadData];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;    
}

- (void)getCommentListFail:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"getCommentListFail : %@", [error description]);
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"网络连接失败"];
}

#pragma mark - UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CommentListViewControllerCellId = @"CommentListViewControllerCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentListViewControllerCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CommentListViewControllerCellId];
    }
    
    cell.textLabel.text = [[self.datas objectAtIndex:[indexPath row]] objectForKey:@"author"];;
    cell.detailTextLabel.text = [[self.datas objectAtIndex:[indexPath row]] objectForKey:@"comment"];;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = [[self.datas objectAtIndex:[indexPath row]] objectForKey:@"comment"];
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:16]
                               forWidth:320
                          lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"content height: %f", size.height);
    return size.height + 10;
}

@end
