//
//  ThemeManager.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeProtocol.h"

@interface ThemeManager : NSObject

+(id<ThemeProtocol>)currentTheme;

+(void)customizeAppAppearence;
+(void)customizeButton:(UIButton *)button forType:(WEThemeButton)buttonType;

@end
