//
//  NewsViewCell.m
//  Watch
//
//  Created by scnfex on 12/25/12.
//
//

#import "NewsViewNewsCell.h"

@interface NewsViewNewsCell ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation NewsViewNewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.bgView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:self.bgView];
        self.bgView.backgroundColor = [UIColor blackColor];
        
        self.text1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 300, 20)];
        self.text1.textColor = [UIColor lightGrayColor];
        self.text1.backgroundColor = [UIColor clearColor];
        [self addSubview:self.text1];
        self.text1.font = [UIFont systemFontOfSize:12];
        
        self.text2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, 300, 26)];
        self.text2.textColor = [UIColor whiteColor];
        self.text2.backgroundColor = [UIColor clearColor];
        [self addSubview:self.text2];
        self.text2.font = [UIFont boldSystemFontOfSize:18];
        
        UIImageView *accessary = [[UIImageView alloc] initWithFrame:CGRectMake(300, 14, 15, 15)];
        accessary.contentMode = UIViewContentModeScaleAspectFit;
        accessary.image = [UIImage imageNamed:@"icon_accessary"];
        [self addSubview:accessary];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.text2.textColor = [UIColor blackColor];
    }
    else {
        self.bgView.backgroundColor = [UIColor blackColor];
        self.text2.textColor = [UIColor whiteColor];
    }
}

@end
