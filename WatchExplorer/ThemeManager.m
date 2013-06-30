//
//  ThemeManager.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "ThemeManager.h"
#import "DefaultTheme.h"

@implementation ThemeManager

+(id<ThemeProtocol>)currentTheme
{
    static id<ThemeProtocol> __currentTheme = nil;
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
