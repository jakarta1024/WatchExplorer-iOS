//
//  WatchDetailViewController.m
//  Watch
//
//  Created by Bobo on 12-12-23.
//
//

#import "WatchDetailViewController.h"
#import "WatchDetailInfoCell.h"
#import "AddCommentViewController.h"
#import "CommentListViewController.h"
#import "Watch.h"
//#import "BSCoreDataManager.h"
//#import "HttpRequestManager.h"
#import "CachingDataModel.h"
#import "NetworkClient.h"

@interface WatchDetailViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Watch *data;

@end

@implementation WatchDetailViewController

- (id)initWithWatchId:(NSString *)watchId
{
    self = [super init];
    if (self) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"watchId = %@", watchId];
        self.data = (Watch *)[[DataModelFactory sharedInstance] getObjectOfClass:[Watch class]
                                                                       predicate:predicate];
    }
    return self;
}

- (void)getWatchInfoFinish:(ASIHTTPRequest *)request {
    NSString *responseString = [request responseString];
    NSLog(@"getWatchInfoFinish : %@", responseString);
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    id results = [parser objectWithString:responseString];
    NSLog(@"results : %@", results);
    
    NSString *returnCode = [results objectForKey:@"returnCode"];
    if ([returnCode isEqualToString:@"1"]) {
        NSDictionary *info = [results objectForKey:@"outputData"];
        self.data.commentsCountValue = [[info objectForKey:@"totalCommentsNum"] intValue];
        [[BSCoreDataManager sharedManager] saveContext];
        
        [self.tableView reloadData];
    }
}

- (void)getWatchInfoFail:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"getWatchInfoFail : %@", [error description]);
    
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"网络连接失败"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = self.data.name;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTitlebarHeight- kTabBarHeight)];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // get watch
    [[HttpRequestManager sharedManager] getWatchInfo:self.data.watchId
                                            delegate:self
                                           finishSel:@selector(getWatchInfoFinish:)
                                             failSel:@selector(getWatchInfoFail:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0:{
            WatchDetailInfoCell *cell = [[WatchDetailInfoCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                   reuseIdentifier:nil];
            cell.controller = self;
            [cell setImages:self.data];
            return cell;
        }
            break;
            
        case 1:{
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                                           reuseIdentifier:nil];
            cell.textLabel.text = @"评论";
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"（共%@条）", self.data.commentsNum];
            cell.detailTextLabel.textColor = [UIColor whiteColor];
            
            UIImageView *accessary = [[UIImageView alloc] initWithFrame:CGRectMake(300, 14, 15, 15)];
            accessary.contentMode = UIViewContentModeScaleAspectFit;
            accessary.image = [UIImage imageNamed:@"icon_accessary"];
            [cell addSubview:accessary];
            return cell;
        }
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0:{
            return 270;
        }
            break;
            
        case 1:{
            return 44;
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0:{
            return nil; // can not select
        }
            break;
            
        case 1:{
            return indexPath;
        }
            break;
            
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0:{
            
        }
            break;
            
        case 1:{
            // open comment list controller
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            CommentListViewController *controller = [[CommentListViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - button selector

- (void)addComment {
    AddCommentViewController *controller = [[AddCommentViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
