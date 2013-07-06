//
//  RegisterViewController.m
//  Watch
//
//  Created by scnfex on 1/21/13.
//
//

#import "RegisterViewController.h"
#import "InputCell.h"
#import "TKAlertCenter.h"
//#import "HttpRequestManager.h"
//#import "UserInfo.h"
#import "DataModel.h"
#import "NetworkClient.h"
#import "ASIHTTPRequest.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) UITextField *usename;
@property (nonatomic, weak) UITextField *password;

@end

@implementation RegisterViewController

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
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"注册"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(registerUser)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isEmailAddress:(NSString *)str {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:str];
}

- (void)registerUser {
    if (self.usename.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"用户名不能为空"];
    }
    else if (self.password.text.length == 0) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"密码不能为空"];
    }
    else if (![self isEmailAddress:self.usename.text]) {
        [[TKAlertCenter defaultCenter] postAlertWithMessage:@"邮箱格式错误"];
    }
    else {
//        [[HttpRequestManager sharedManager] registerUser:self.usename.text
//                                                password:self.password.text
//                                                delegate:self
//                                               finishSel:@selector(registerUserFinish:)
//                                                 failSel:@selector(registerUserFail:)];
    }
}

- (void)registerUserFinish:(ASIHTTPRequest *)request {
//    NSString *responseString = [request responseString];
//    NSLog(@"autoRegisterFinish : %@", responseString);
//    
//    SBJsonParser *parser = [[SBJsonParser alloc] init];
//    id results = [parser objectWithString:responseString];
//    NSLog(@"results : %@", results);
//    
//    NSString *returnCode = [results objectForKey:@"returnCode"];
//    if ([returnCode isEqualToString:@"1"]) {
//        UserInfo *userInfo = (UserInfo *)[[DataModelFactory sharedInstance] getObjectOfClass:[UserInfo class]];
//        userInfo.username = self.usename.text;
//        userInfo.password = self.password.text;
//        [[DataModelFactory sharedInstance] saveContext];
//    }
}

- (void)registerUserFail:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"autoRegisterFail : %@", [error description]);
    
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"网络连接失败"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"LoginViewControllerCell";
    InputCell *cell = (InputCell *)[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[InputCell alloc] initWithStyle:UITableViewCellStyleValue1
                                reuseIdentifier:cellid];
    }
    
    cell.input.delegate = self;
    
    switch (indexPath.row) {
        case 0:{
            cell.title.text = @"用户名：";
            cell.input.placeholder = @"请输入注册邮箱";
            self.usename = cell.input;
            cell.input.returnKeyType = UIReturnKeyNext;
        }
            break;
        case 1:{
            cell.title.text = @"密码：";
            cell.input.placeholder = @"请输入密码";
            cell.input.clearsOnBeginEditing = YES;
            cell.input.secureTextEntry = YES;
            self.password = cell.input;
            cell.input.returnKeyType = UIReturnKeyDone;
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.usename) {
        [self.usename resignFirstResponder];
        [self.password becomeFirstResponder];
    }
    else if (textField == self.password) {
        [self.password resignFirstResponder];
        [self registerUser];
    }
    return YES;
}


@end
