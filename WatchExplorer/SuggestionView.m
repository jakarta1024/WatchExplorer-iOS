//
//  SuggestionView.m
//  Watch
//
//  Created by scnfex on 12/18/12.
//
//

#import "SuggestionView.h"
#import "TKCoverflowView.h"
#import "WatchDetailViewController.h"
#import "RankViewController.h"

// size
#define kCoverViewHeight 200

@interface SuggestionView ()

@property (nonatomic, strong) TKCoverflowView *coverflow;
@property (nonatomic, strong) NSMutableArray *covers; // album covers images
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *detail;

- (void)createCoverView;

@end

@implementation SuggestionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.covers = [NSMutableArray array];
        [self.covers addObject:[UIImage imageNamed:@"watch1.png"]];
        [self.covers addObject:[UIImage imageNamed:@"watch2.png"]];
        
        [self createCoverView];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                               self.coverflow.frame.origin.y + self.coverflow.frame.size.height,
                                                               kScreenWidth - 20,
                                                               30)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.textColor = [UIColor orangeColor];
        [self addSubview:self.title];
        self.title.text = @"Title";
        
        self.detail = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                                self.title.frame.origin.y + self.title.frame.size.height,
                                                                kScreenWidth - 20,
                                                                20)];
        self.detail.backgroundColor = [UIColor clearColor];
        self.detail.textColor = [UIColor whiteColor];
        [self addSubview:self.detail];
        self.detail.text = @"content";
    }
    return self;
}

- (void)createCoverView {
    self.coverflow = [[TKCoverflowView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCoverViewHeight)];
    self.coverflow.coverflowDelegate = self;
    self.coverflow.coverflowDataSource = self;
    self.coverflow.coverSize = CGSizeMake(150, 150);
//    self.coverflow.coverAngle = 1;
    [self addSubview:self.coverflow];
    self.coverflow.contentMode = UIViewContentModeScaleAspectFit;
    
//    [self.coverflow setNumberOfCovers:10];
}


#pragma mark - TKCoverflowView delegate

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(int)index{
	DebugLog(@"Front %d",index);
}

- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasTappedInFront:(int)index tapCount:(NSInteger)tapCount{
    
    WatchDetailViewController *controller = [[WatchDetailViewController alloc] init];
    [self.rankViewController.navigationController pushViewController:controller animated:YES];
}

#pragma mark - TKCoverflowView datasource

- (TKCoverflowCoverView *) coverflowView:(TKCoverflowView *)coverflowView coverForIndex:(NSInteger)index
{
	
	TKCoverflowCoverView *cover = [coverflowView dequeueReusableCoverView];
	
	if(cover == nil){        
		cover = [[TKCoverflowCoverView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)]; // 224
//		cover.baseline = 150;
		
	}
	cover.image = [self.covers objectAtIndex:index%[self.covers count]];
    
	return cover;
	
}

- (NSInteger)numberOfCoversInCoverflowView:(TKCoverflowView *)coverflowView {
    return 10;
}


@end
