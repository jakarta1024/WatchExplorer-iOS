//
//  AppDelegate.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "AppDelegate.h"
#import "AKTabBarController.h"
#import "NewsViewController.h"

#define THUMBNAIL_CACHE_NAME @"Thumbnails"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    // Override point for customization after application launch.
    _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:40];
    _tabBarController.minimumHeightToDisplayTitle = 35;
    if (nil == _newsViewController) {
        _newsViewController = [[NewsViewController alloc] initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    }
    UIViewController *testvc = [[UIViewController alloc] initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    testvc.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    _tabBarController.viewControllers = [NSMutableArray arrayWithArray:@[_newsViewController, testvc]];
    //
    _window.rootViewController = _tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Extension Methods

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
}
/**
 Returns the URL to the application's Support directory.
 */
- (NSURL *)applicationSupportDirectory
{
    NSURL * returnValue = [[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask][0];
    [[NSFileManager defaultManager] createDirectoryAtURL:returnValue withIntermediateDirectories:YES attributes:nil error:nil];
    return returnValue;
}

/**
 Returns the URL to the application's Download directory.
 */
- (NSURL *)applicationCachesDirectory
{
    NSURL * returnValue = [[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask][0];
    //    [[NSFileManager defaultManager] createDirectoryAtURL:returnValue withIntermediateDirectories:YES attributes:nil error:nil];
    return returnValue;
}


/**
 Returns the URL to the application's Thumbnail directory.
 */
- (NSURL *)applicationThumbnailDirectory
{
    NSURL* returnValue = [self applicationCachesDirectory];
    returnValue = [returnValue URLByAppendingPathComponent:THUMBNAIL_CACHE_NAME isDirectory:YES];
    
    NSError * error = nil;
    [[NSFileManager defaultManager] createDirectoryAtURL:returnValue withIntermediateDirectories:YES attributes:nil error:&error];
    if(error)
        NSLog(@"Error creating thumbnail directory at %@\n%@", returnValue, error);
    return returnValue;
}



@end
