//
//  RankViewController.m
//  Watch
//
//  Created by scnfex on 12/17/12.
//
//

#import "RankViewController.h"
#import "WatchListCell.h"
#import "SuggestionView.h"
#import "WatchDetailViewController.h"
#import "DataModel.h"
#import "Watch.h"

// size
#define kSectionBarHeight 35
#define kTableViewCellHeight 105
#define kTitleSegmentWidth 100
#define kTitleSegmentHeight 30
#define kRankSegmentWidth 250
#define kRankSegmentHeight 25
#define kSuggestSegmentWidth 200
#define kSuggestSegmentHeight 25

@interface RankViewController ()

//@property (nonatomic, strong) UIView *titleBar;
@property (nonatomic, strong) UIView *sectionBar;
@property (nonatomic, strong) UITableView *rankView;
@property (nonatomic, strong) SuggestionView *SuggestionView;
@property (nonatomic, strong) NSArray *datas;

//- (void)createTitleBar;
- (void)createSectionBar;
- (void)openSuggestList;
- (void)openRankList;

@end

@implementation RankViewController

- (id)init
{
    self = [super init];
    if (self) {
        // read data from core data
//        NSArray *watchDatas = [[DataModelFactory sharedInstance] getAllObjectOfClass:[Watch class]];
//        self.datas = [NSArray arrayWithArray:watchDatas];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [self createTitleBar];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"推荐", @"排行"]];
    segment.frame = CGRectMake(kScreenWidth/2 - kTitleSegmentWidth/2,
                               kTitleBarHeight/2 - kTitleSegmentHeight/2,
                               kTitleSegmentWidth, kTitleSegmentHeight);
    [segment addTarget:self
                action:@selector(changeList:)
      forControlEvents:UIControlEventValueChanged];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    
    self.navigationItem.titleView = segment;
    
    [self createSectionBar];
    
    [self openRankList];
    segment.selectedSegmentIndex = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)createTitleBar {
//    self.titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTitlebarHeight)];
//    [self.view addSubview:self.titleBar];
//    self.titleBar.backgroundColor = [UIColor whiteColor];
//    
//}

- (void)changeList:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    if (seg.selectedSegmentIndex == 0) {
        [self openSuggestList];
    }
    else if (seg.selectedSegmentIndex == 1) {
        [self openRankList];
    }
}

- (void)createSectionBar {
    self.sectionBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSectionBarHeight)];
    [self.view addSubview:self.sectionBar];
    self.sectionBar.backgroundColor = [UIColor colorWithRed:30.0f/255.0f
                                                      green:35.0f/255.0f
                                                       blue:50.0f/255.0f
                                                      alpha:1.0f];
}

- (void)openSuggestList {
    if (!self.SuggestionView) {
        self.SuggestionView = [[SuggestionView alloc] initWithFrame:CGRectMake(0,
                                                                    kSectionBarHeight,
                                                                    kScreenWidth,
                                                                    kScreenHeight - kTitleBarHeight - kTabBarHeight - kSectionBarHeight)];
        self.SuggestionView.rankViewController = self;
    }
    [self.rankView removeFromSuperview];
    [self.view addSubview:self.SuggestionView];
    
    for (UISegmentedControl *seg in self.sectionBar.subviews) {
        [seg removeFromSuperview];
    }
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"经典", @"新款"]];
    segment.frame = CGRectMake(kScreenWidth/2 - kSuggestSegmentWidth/2,
                               kSectionBarHeight/2 - kSuggestSegmentHeight/2,
                               kSuggestSegmentWidth, kSuggestSegmentHeight);
    [segment addTarget:self
                action:@selector(changeSuggestSegment:)
      forControlEvents:UIControlEventValueChanged];
    [self.sectionBar addSubview:segment];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.tintColor = [UIColor blackColor];
}

- (void)changeSuggestSegment:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    if (seg.selectedSegmentIndex == 0) {
        
    }
    else if (seg.selectedSegmentIndex == 1) {
        
    }
}

- (void)openRankList {
    if (!self.rankView) {
        self.rankView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                         kSectionBarHeight,
                                                                         kScreenWidth,
                                                                         kScreenHeight - kTitleBarHeight - kTabBarHeight - kSectionBarHeight)];
        self.rankView.dataSource = self;
        self.rankView.delegate = self;
        self.rankView.backgroundColor = [UIColor clearColor];
    }
    [self.SuggestionView removeFromSuperview];
    [self.view addSubview:self.rankView];
    
    for (UISegmentedControl *seg in self.sectionBar.subviews) {
        [seg removeFromSuperview];
    }
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"按评分", @"按收藏", @"按搜索"]];
    segment.frame = CGRectMake(kScreenWidth/2 - kRankSegmentWidth/2,
                               kSectionBarHeight/2 - kRankSegmentHeight/2,
                               kRankSegmentWidth, kRankSegmentHeight);
    [segment addTarget:self
                action:@selector(changeRankSegment:)
      forControlEvents:UIControlEventValueChanged];
    [self.sectionBar addSubview:segment];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.tintColor = [UIColor blackColor];
}

- (void)changeRankSegment:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    if (seg.selectedSegmentIndex == 0) {
        
    }
    else if (seg.selectedSegmentIndex == 1) {
        
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"RankViewControllerCell";
    WatchListCell *cell = (WatchListCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[WatchListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:cellid];
    }
    
    Watch *data = [self.datas objectAtIndex:[indexPath row]];
    
//    NSString *imgName = [NSString stringWithFormat:@"watch%d.png", [indexPath row]%2+1];
//    UIImage *image = [UIImage imageNamed:imgName];
//    cell.imageView.image = image;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *imageFolder = [path stringByAppendingFormat:@"/Images/%@", data.watchIdentifier];
    NSString *imagePath = [NSString stringWithFormat:@"%@/0.png", imageFolder];
    cell.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    
    cell.label1.text = data.name;
    cell.label2.text = data.simpleDescription;
    cell.label3.text = data.brand;
    cell.label4.text = [NSString stringWithFormat:@"%@ $", data.price];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Watch *data = [self.datas objectAtIndex:[indexPath row]];
    
    WatchDetailViewController *controller = [[WatchDetailViewController alloc] initWithWatchId:data.watchIdentifier];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
