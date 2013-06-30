//
//  WatchDetailInfoCell.m
//  Watch
//
//  Created by scnfex on 1/28/13.
//
//

#import "WatchDetailInfoCell.h"
#import "UIGlossyButton.h"
#import "UIView+LayerEffects.h"
//#import "UIImageView+WebCache.h"

@interface WatchDetailInfoCell ()

@property (nonatomic, strong) UIScrollView *imagesView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation WatchDetailInfoCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.imagesView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 175, 250)];
        
        self.imagesView.pagingEnabled = YES;
        self.imagesView.delegate = self;
        [self addSubview:self.imagesView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,
                                                                           self.imagesView.frame.origin.y + self.imagesView.frame.size.height,
                                                                           self.imagesView.frame.size.width,
                                                                           20)];
        [self addSubview:self.pageControl];
        
        UIButton *button1 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(self.imagesView.frame.origin.x + self.imagesView.frame.size.width + 10, 5, 125, 35);
        [button1 setTitle:@"放大"
                 forState:UIControlStateNormal];
        [self addSubview:button1];
        [button1 useWhiteLabel: YES];
        button1.tintColor = [UIColor lightGrayColor];
        [button1 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        
        UIButton *button2 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(button1.frame.origin.x, 45, 125, 35);
        [button2 setTitle:@"加入搜收藏"
                 forState:UIControlStateNormal];
        [self addSubview:button2];
        [button2 useWhiteLabel: YES];
        button2.tintColor = [UIColor lightGrayColor];
        [button2 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        
        UIButton *button3 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button3.frame = CGRectMake(button1.frame.origin.x, 85, 125, 35);
        [button3 setTitle:@"搜店"
                 forState:UIControlStateNormal];
        [self addSubview:button3];
        [button3 useWhiteLabel: YES];
        button3.tintColor = [UIColor lightGrayColor];
        [button3 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        
        UIButton *button4 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button4.frame = CGRectMake(button1.frame.origin.x, 125, 125, 35);
        [button4 setTitle:@"评论打分"
                 forState:UIControlStateNormal];
        [self addSubview:button4];
        [button4 useWhiteLabel: YES];
        button4.tintColor = [UIColor lightGrayColor];
        [button4 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        [button4 addTarget:self.controller action:@selector(addComment) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button5 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button5.frame = CGRectMake(button1.frame.origin.x, 165, 125, 35);
        [button5 setTitle:@"微博分享"
                 forState:UIControlStateNormal];
        [self addSubview:button5];
        [button5 useWhiteLabel: YES];
        button5.tintColor = [UIColor lightGrayColor];
        [button5 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
        
        UIButton *button6 = [UIGlossyButton buttonWithType:UIButtonTypeCustom];
        button6.frame = CGRectMake(button1.frame.origin.x, 205, 125, 35);
        [button6 setTitle:@"35000 $"
                 forState:UIControlStateNormal];
        [self addSubview:button6];
        [button6 useWhiteLabel: YES];
        button6.tintColor = [UIColor redColor];
        [button6 setShadow:[UIColor blackColor] opacity:0.8 offset:CGSizeMake(0, 1) blurRadius: 4];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = self.imagesView.contentOffset.x / self.imagesView.frame.size.width;
    self.pageControl.currentPage = page;
}

- (void)setImages:(Watch *)data {
    for (int i = 0; i != data.imageCountValue; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.imagesView.frame.size.width,
                                                                               0,
                                                                               self.imagesView.frame.size.width,
                                                                               self.imagesView.frame.size.height)];
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self.imagesView addSubview:image];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        NSString *imageFolder = [path stringByAppendingFormat:@"/Images/%@", data.watchIdentifier];
        NSString *imagePath = [NSString stringWithFormat:@"%@/%d.png", imageFolder, i];
        image.image = [UIImage imageWithContentsOfFile:imagePath];
    }
    self.imagesView.contentSize = CGSizeMake(data.imageCountValue*self.imagesView.frame.size.width, self.imagesView.frame.size.width);
    
    self.pageControl.numberOfPages = data.imageCountValue;
}

@end
