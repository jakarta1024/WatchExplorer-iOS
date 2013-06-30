//
//  WatchViewController.m
//  Watch
//
//  Created by Bobo on 12-12-18.
//
//

#import "WatchViewController.h"
#import "WatchListViewController.h"

//#define kMenuHeight 230
#define kTableViewCellHeight 44
#define kPickerHeight 216

@interface WatchViewController ()

@property (nonatomic, strong) UITableView *menu;
@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong) id currentPickerData;

- (void)createMenu;
- (void)createPicker;

@end

@implementation WatchViewController

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
    self.title = @"搜表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                           target:self
                                                                                           action:@selector(search)];
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,kScreenWidth, kScreenHeight - kTitlebarHeight - kTabbarHeight)];
//    [self.view addSubview:self.scrollView];
    
    [self createMenu];
//    [self createPicker];
    
//    self.scrollView.contentSize = CGSizeMake(kScreenWidth, kMenuHeight + kPickerHeight);
}

- (void)search {
    WatchListViewController *controller = [[WatchListViewController alloc] init];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)createTitleBar {
//    self.titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTitlebarHeight)];
//    [self.view addSubview:self.titleBar];
//    self.titleBar.backgroundColor = [UIColor blackColor];
//    
////    UIButton *searchBtn = 
//}

- (void)createMenu {
    self.menu = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTitleBarHeight - kTabBarHeight)
                                             style:UITableViewStyleGrouped];
    [self.view addSubview:self.menu];
    self.menu.dataSource = self;
    self.menu.delegate = self;
    self.menu.scrollEnabled = NO;
    
    self.menu.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
}

- (void)createPicker {
//    self.picker = [[UIPickerView alloc] init];
//    self.picker.dataSource = self;
//    self.picker.delegate = self;
//    [self.scrollView addSubview:self.picker];
//    
//    CGRect frame = self.picker.frame;
//    frame.origin.y = self.menu.frame.origin.y + self.menu.frame.size.height;
//    self.picker.frame = frame;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"WatchViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellid];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    switch (indexPath.row) {
        case 0:{
            cell.textLabel.text = @"品牌";
            cell.detailTextLabel.text = @"卡迪尔";
            cell.imageView.image = [UIImage imageNamed:@"icon_band"];
        }
            break;
        case 1:{
            cell.textLabel.text = @"价格范围";
            cell.detailTextLabel.text = @"2万以下";
            cell.imageView.image = [UIImage imageNamed:@"icon_usd"];
        }
            break;
        case 2:{
            cell.textLabel.text = @"机械";
            cell.detailTextLabel.text = @"机械腕表";
            cell.imageView.image = [UIImage imageNamed:@"icon_tool"];
        }
            break;
        case 3:{
            cell.textLabel.text = @"款式";
            cell.detailTextLabel.text = @"男式";
            cell.imageView.image = [UIImage imageNamed:@"icon_gender"];
        }
            break;
        case 4:{
            cell.textLabel.text = @"功能";
            cell.detailTextLabel.text = @"陀飞轮，潜水";
            cell.imageView.image = [UIImage imageNamed:@"icon_func"];
        }
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[UIViewController alloc] init];
    
    int row = [indexPath row];
    switch (row) {
        case 0: {
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WatchBand" ofType:@"plist"];
            self.currentPickerData = [NSArray arrayWithContentsOfFile:filePath];
            NSLog(@"%@", self.currentPickerData);
        }
            break;
            
        case 1: {
            
        }
            break;
            
        case 2: {
            
        }
            break;
            
        case 3: {
            
        }
            break;
            
        case 4: {
            
        }
            break;
            
            
        default:
            break;
    }
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.dataSource = self;
    picker.delegate = self;
    [controller.view addSubview:picker];
    picker.showsSelectionIndicator = YES;
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.currentPickerData count];
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [self.currentPickerData objectAtIndex:row];
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    if (component == 0) {
//        return 100;
//    }
//    else if (component == 1) {
//        return 300;
//    }
//    return 0;
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

@end
