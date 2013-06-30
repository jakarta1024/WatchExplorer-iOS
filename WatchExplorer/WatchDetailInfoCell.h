//
//  WatchDetailInfoCell.h
//  Watch
//
//  Created by scnfex on 1/28/13.
//
//

#import <UIKit/UIKit.h>
#import "Watch.h"

@interface WatchDetailInfoCell : UITableViewCell <UIScrollViewDelegate>

@property (nonatomic, weak) UIViewController *controller;

- (void)setImages:(Watch *)data;

@end
