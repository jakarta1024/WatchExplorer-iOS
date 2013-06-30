//
//  WatchDetailCommentCell.m
//  Watch
//
//  Created by scnfex on 1/28/13.
//
//

#import "WatchDetailCommentCell.h"

@implementation WatchDetailCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        float margin = 5;
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin, 20, 20)];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont systemFontOfSize:15];
        title.text = @"评论";
        [self addSubview:title];
        
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x + 5, margin, 50, 20)];
        number.backgroundColor = [UIColor clearColor];
        number.textColor = [UIColor whiteColor];
        number.font = [UIFont systemFontOfSize:16];
        [self addSubview:number];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
