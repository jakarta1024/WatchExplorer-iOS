//
//  LoginCell.m
//  Watch
//
//  Created by scnfex on 1/15/13.
//
//

#import "InputCell.h"

@implementation InputCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, self.bounds.size.height)];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont boldSystemFontOfSize:16];
        self.title.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.title];
        
        self.input = [[UITextField alloc] initWithFrame:CGRectMake(self.title.frame.origin.x + self.title.frame.size.width + 5,
                                                                   10,
                                                                   self.bounds.size.width - self.title.frame.size.width - 20,
                                                                   self.bounds.size.height)];
        
        [self addSubview:self.input];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
