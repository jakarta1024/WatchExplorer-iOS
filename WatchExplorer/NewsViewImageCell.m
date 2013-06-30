//
//  NewsViewImageCell.m
//  Watch
//
//  Created by scnfex on 1/22/13.
//
//

#import "NewsViewImageCell.h"


@implementation NewsViewImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        self.image.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.image];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
