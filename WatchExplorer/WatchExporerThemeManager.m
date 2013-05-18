//
//  WatchExporerThemeManager.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "WatchExporerThemeManager.h"
#import "DefaultTheme.h"

@implementation WatchExporerThemeManager

+(id<WatchExplorerThemeProtocol>)currentTheme
{
    static id<WatchExplorerThemeProtocol> __currentTheme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __currentTheme = [[DefaultTheme alloc] init];
    });
    return __currentTheme;
}

+(void)customizeAppAppearence
{

}
+(void)customizeButton:(UIButton *)button forType:(WEThemeButton)buttonType
{


}

@end
