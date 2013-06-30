//
//  WatchListViewController.m
//  Watch
//
//  Created by Bobo on 12-12-23.
//
//

#import "WatchListViewController.h"
#import "WatchListCell.h"
#import "WatchDetailViewController.h"

#define kTableViewCellHeight 105

@interface WatchListViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WatchListViewController

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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   kScreenWidth,
                                                                   kScreenHeight - kTitleBarHeight - kTabBarHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"WatchListViewControllerCell";
    WatchListCell *cell = (WatchListCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[WatchListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellid];
    }
    NSString *imgName = [NSString stringWithFormat:@"watch%d.png", [indexPath row]%2+1];
    cell.imageView.image = [UIImage imageNamed:imgName];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.label1.text = @"Patek Philippe";
    cell.label2.text = @"Calendrier Annuel ref.5205G";
    cell.label3.text = @"Boutique : MMC Marbeul";
    cell.label4.text = @"35 000 $";
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WatchDetailViewController *controller = [[WatchDetailViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
