//
//  NewsDetailViewController.m
//  Watch
//
//  Created by scnfex on 12/19/12.
//
//

#import "NewsDetailViewController.h"

#define kBackBtnWidth 50
#define kBackBtnHeight 30

@interface NewsDetailViewController ()

@property (nonatomic, strong) UIScrollView *contentView;

- (void)createTitleBar;
- (void)loadData;

@end

@implementation NewsDetailViewController

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
    
    [self createTitleBar];
    
    self.contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kTitleBarHeight, kScreenWidth,
                                                                      kScreenHeight - kTitleBarHeight - kTabBarHeight)];
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor colorWithRed:20.0f/255.0f
                                                       green:25.0f/255.0f
                                                        blue:33.0f/255.0f
                                                       alpha:1.0f];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    UIImage *image = [UIImage imageNamed:@"news.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, image.size.height)];
    imageView.image = image;
    [self.contentView addSubview:imageView];
    
    NSString *titleStr = @"NEWS TITLE";
    UIFont *titleFont = [UIFont systemFontOfSize:20];
    CGSize titleSize = [titleStr sizeWithFont:titleFont
                            constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)
                                lineBreakMode:NSLineBreakByWordWrapping];
    
    UITextView *title = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                     imageView.frame.origin.y + imageView.frame.size.height,
                                                                     kScreenWidth,
                                                                     titleSize.height + 10)];
    title.text = titleStr;
    title.font = titleFont;
    title.scrollEnabled = NO;
    [self.contentView addSubview:title];
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    title.editable = NO;
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              title.frame.origin.y + title.frame.size.height,
                                                              kScreenWidth,
                                                              20)];
    time.text = @"2012-11-19";
    time.font = [UIFont systemFontOfSize:15];
    time.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:time];
    time.textColor = [UIColor whiteColor];

    NSString *chapterStr = @"jfaksjdf;kalsjdf;akjsdfkljasdlkfjas;dkjfa;slkdjfaksjdf;laksjflkajsdfkajsd;flkjas;dlkfjaslkdjf;lakjdf;ljfaksjdf;kalsjdf;akjsdfkljasdlkfjas;dkjfa;slkdjfaksjdf;laksjflkajsdfkajsd;flkjas;dlkfjaslkdjf;lakjdf;lsd;jfas;djf;aslkjf;aksljdf;lkasdjf;iasjdfio;asjdf;oiasjf;oij";
    UIFont *chapterFont = [UIFont systemFontOfSize:15];
    CGSize chapterSize = [chapterStr sizeWithFont:chapterFont
                            constrainedToSize:CGSizeMake(kScreenWidth, MAXFLOAT)
                                  lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"%f", chapterSize.height);
    UITextView *chapter = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                     time.frame.origin.y + time.frame.size.height,
                                                                     kScreenWidth,
                                                                     chapterSize.height+10)];
    chapter.text = chapterStr;
    chapter.font = chapterFont;
    chapter.scrollEnabled = NO;
    [self.contentView addSubview:chapter];
    chapter.textColor = [UIColor whiteColor];
    chapter.backgroundColor = [UIColor clearColor];
    chapter.editable = NO;
    
    self.contentView.contentSize = CGSizeMake(kScreenWidth,
                                              imageView.frame.size.height +
                                              title.frame.size.height +
                                              time.frame.size.height +
                                              chapter.frame.size.height);
}

- (void)createTitleBar {
    UIView *titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTitleBarHeight)];
    titleBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titleBar];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, kTitleBarHeight/2 - kBackBtnHeight/2,
                               kBackBtnWidth, kBackBtnHeight);
    [titleBar addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    
    UILabel *title1 = [[UILabel alloc] initWithFrame:CGRectMake(175, 5, 75, kTitleBarHeight)];
    title1.backgroundColor = [UIColor clearColor];
    title1.text = @"新闻促销";
    title1.font = [UIFont systemFontOfSize:18];
    title1.textColor = [UIColor whiteColor];
    [titleBar addSubview:title1];
    
    UILabel *title2 = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 75, kTitleBarHeight)];
    title2.backgroundColor = [UIColor clearColor];
    title2.text = @"News";
    title2.font = [UIFont systemFontOfSize:18];
    title2.textColor = [UIColor whiteColor];
    [titleBar addSubview:title2];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
