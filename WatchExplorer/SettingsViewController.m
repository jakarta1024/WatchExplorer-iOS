//
//  SettingsViewController.m
//  Watch
//
//  Created by scnfex on 1/15/13.
//
//

#import "SettingsViewController.h"
#import "SettingsCell.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface SettingsViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SettingsViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTitleBarHeight - kTabBarHeight)
                                                      style:UITableViewStyleGrouped];
        self.tableView.scrollEnabled = NO;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"设置";
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
    static NSString *cellid = @"SettingsViewControllerCell";
    SettingsCell *cell = (SettingsCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[SettingsCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellid];
    }
    
    switch (indexPath.row) {
        case 0:{
            cell.text.text = @"登陆";
        }
            break;
        case 1:{
            cell.text.text = @"注册";
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            LoginViewController *controller = [[LoginViewController alloc] init];
            controller.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTabBarHeight);
            [self.navigationController pushViewController:controller animated:YES];

        }
            break;
        case 1:{
            RegisterViewController *controller = [[RegisterViewController alloc] init];
            controller.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTabBarHeight);
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
