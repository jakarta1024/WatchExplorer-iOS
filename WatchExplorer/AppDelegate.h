//
//  AppDelegate.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AKTabBarController *tabBarController;


-(NSURL *)applicationDocumentPath;

@end
