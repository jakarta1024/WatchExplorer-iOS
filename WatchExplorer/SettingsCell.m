//
//  SettingsCell.m
//  Watch
//
//  Created by scnfex on 1/15/13.
//
//

#import "SettingsCell.h"

@implementation SettingsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.text = [[UILabel alloc] initWithFrame:self.bounds];
        self.text.backgroundColor = [UIColor clearColor];
        self.text.font = [UIFont boldSystemFontOfSize:18];
        self.text.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.text];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
