//
//  WatchExporerThemeManager.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WatchExplorerThemeProtocol.h"

@interface WatchExporerThemeManager : NSObject

+(id<WatchExplorerThemeProtocol>)currentTheme;

+(void)customizeAppAppearence;
+(void)customizeButton:(UIButton *)button forType:(WEThemeButton)buttonType;

@end
