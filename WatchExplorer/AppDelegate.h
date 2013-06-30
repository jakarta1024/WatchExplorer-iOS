//
//  AppDelegate.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKTabBarController;
@class NewsViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AKTabBarController *tabBarController;

//MARK: viewControllers
@property (strong, nonatomic) NewsViewController *newsViewController;

- (NSURL *)applicationDocumentsDirectory;
- (NSURL *)applicationSupportDirectory;
- (NSURL *)applicationCachesDirectory;
- (NSURL *)applicationThumbnailDirectory;

@end
