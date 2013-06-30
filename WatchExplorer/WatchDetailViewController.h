//
//  WatchDetailViewController.h
//  Watch
//
//  Created by Bobo on 12-12-23.
//
//

#import <UIKit/UIKit.h>

@interface WatchDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

- (id)initWithWatchId:(NSString *)watchId;

@end
