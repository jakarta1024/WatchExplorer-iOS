//
//  SuggestionView.h
//  Watch
//
//  Created by scnfex on 12/18/12.
//
//

#import <UIKit/UIKit.h>
#import "TKCoverflowView.h"

@class RankViewController;

@interface SuggestionView : UIView <TKCoverflowViewDelegate,TKCoverflowViewDataSource,UIScrollViewDelegate>

@property (nonatomic, weak) RankViewController *rankViewController;

@end
