//
//  AddCommentViewController.m
//  Watch
//
//  Created by scnfex on 1/28/13.
//
//

#import "AddCommentViewController.h"
#import "StarIconView.h"
#import <QuartzCore/QuartzCore.h>
#import "AKTabBarController.h"
#import "AppDelegate.h"
//#import "HttpRequestManager.h"
#import "NetworkClient.h"
#import "TKAlertCenter.h"
//#import "MBProgressHUD.h"

@interface AddCommentViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *rateLabel1;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) StarIconView *starsView;

@end

@implementation AddCommentViewController

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
    self.title = @"添加评论";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTitleBarHeight- kTabbarHeight)];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 50)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    label.text = @"总体评价";
    [headerView addSubview:label];
    
    self.starsView = [[StarIconView alloc] initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, 5, 200.0f, 40.0f)];
    self.starsView.show_star = 0;
    self.starsView.isSelect = YES;
    self.starsView.font_size = 35;
    [headerView addSubview:self.starsView];
    
    self.tableView.tableHeaderView = headerView;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"提交"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(sendComment)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendComment {
    NSString *text = @"";
    if (self.textView.textColor != [UIColor lightGrayColor]) {
        text = self.textView.text;
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[HttpRequestManager sharedManager] addComment:@"1002"
                                              text:text
                                         totalRate:self.starsView.show_star
                                      prospectRate:0
                                          delegate:self
                                         finishSel:@selector(sendCommentFinish:)
                                           failSel:@selector(sendCommentFail:)];
}

- (void)sendCommentFinish:(ASIHTTPRequest *)request {
    NSString *responseString = [request responseString];
    NSLog(@"sendCommentFinish : %@", responseString);
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    id results = [parser objectWithString:responseString];
    NSLog(@"results : %@", results);
    
    NSString *returnCode = [results objectForKey:@"returnCode"];
    if ([returnCode isEqualToString:@"1"]) {
        
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)sendCommentFail:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"sendCommentFail : %@", [error description]);
    
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"网络连接失败"];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *AddCommentViewControllerCellid = @"AddCommentViewControllerCellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddCommentViewControllerCellid];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:AddCommentViewControllerCellid];
    }
    
    int row = [indexPath row];
    if (row == 0) {
        UIView *roundView = [[UIView alloc] initWithFrame:CGRectMake(2, 2, kScreenWidth - 4, 40)];
        roundView.layer.cornerRadius = 4;
        roundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        [cell addSubview:roundView];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 44)];
        label1.backgroundColor = [UIColor clearColor];
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont boldSystemFontOfSize:16];
        label1.text = @"机芯";
        [cell addSubview:label1];
        
        self.rateLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(220, 0, 100, 44)];
        self.rateLabel1.backgroundColor = [UIColor clearColor];
        self.rateLabel1.textColor = [UIColor lightGrayColor];
        self.rateLabel1.font = [UIFont systemFontOfSize:16];
        self.rateLabel1.text = @"点击评分";
        [cell addSubview:self.rateLabel1];
        
        UIImageView *accessary = [[UIImageView alloc] initWithFrame:CGRectMake(300, 14, 15, 15)];
        accessary.contentMode = UIViewContentModeScaleAspectFit;
        accessary.image = [UIImage imageNamed:@"icon_accessary"];
        [cell addSubview:accessary];
    }
    else if (row == 1) {
        UIView *roundView = [[UIView alloc] initWithFrame:CGRectMake(2, 2, kScreenWidth-4, 96)];
        roundView.layer.cornerRadius = 4;
        roundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        [cell addSubview:roundView];
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5,
                                                                            roundView.frame.size.width-10,
                                                                            roundView.frame.size.height-10)];
        self.textView.font = [UIFont systemFontOfSize:16];
        [roundView addSubview:self.textView];
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.textColor = [UIColor lightGrayColor];
        self.textView.text = @"点击评价";
        self.textView.delegate = self;
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        toolbar.barStyle = UIBarStyleBlack;
        UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
        UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"完成"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(completeWrite)];
        [toolbar setItems:@[item1, item2]];
        self.textView.inputAccessoryView = toolbar;
    }
    else if (row == 2) {
        
    }
    
    return cell;
}

- (void)completeWrite {
//    NSLog(@"completeWrite");
    [self.textView resignFirstResponder];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0: {
            return 44;
        }
            break;
            
        case 1: {
            return 100;
        }
            break;
            
        default:
            break;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int row = [indexPath row];
    
    if (row == 0) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择评分"
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"非常好（4）", @"很好（3）", @"好（2）", @"一般（1）", @"差（0）", nil];
        sheet.tag = 0;
        [sheet showFromTabBar:[(AppDelegate *)[UIApplication sharedApplication].delegate viewController].bar];

    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 0) {
        switch (buttonIndex) {
            case 0:{
                self.rateLabel1.text = @"非常好（4）";
                self.rateLabel1.textColor = [UIColor redColor];
            }
                break;
                
            case 1:{
                self.rateLabel1.text = @"很好（3）";
                self.rateLabel1.textColor = [UIColor redColor];
            }
                break;
                
            case 2:{
                self.rateLabel1.text = @"好（2）";
                self.rateLabel1.textColor = [UIColor redColor];
            }
                break;
                
            case 3:{
                self.rateLabel1.text = @"一般（1）";
                self.rateLabel1.textColor = [UIColor redColor];
            }
                break;
                
            case 4:{
                self.rateLabel1.text = @"差（0）";
                self.rateLabel1.textColor = [UIColor redColor];
            }
                break;
                
                
            default:
                break;
        }
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView.textColor == [UIColor lightGrayColor]) {
        textView.textColor = [UIColor whiteColor];
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length == 0) {
        textView.textColor = [UIColor lightGrayColor];
        textView.text = @"点击评价";
    }
}

@end
