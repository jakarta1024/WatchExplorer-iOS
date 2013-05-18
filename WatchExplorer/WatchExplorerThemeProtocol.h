//
//  WatchExplorerThemeProtocol.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 \defgroup Watch Explorer Theme Protocol
 @{
 */
//!\ingroup Theme Componnets Type Definition
//!@{
typedef NS_ENUM(NSUInteger, WEThemeButton) {
    WEThemeButtonDefault,
};

typedef NS_ENUM(NSUInteger, WEThemeTitileBar) {
    WEThemeTitileBarDefault,
};

typedef NS_ENUM(NSUInteger, WEThemeBackground) {
    WEThemeBackgroundDefault,
};

typedef NS_ENUM(NSUInteger, WEThemeLabel) {
    WEThemeLabelDefault,
};

//!@}

@protocol WatchExplorerThemeProtocol <NSObject>

@end

//!@}
