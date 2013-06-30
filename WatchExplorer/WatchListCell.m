//
//  WatchListCell.m
//  Watch
//
//  Created by Bobo on 12-12-23.
//
//

#import "WatchListCell.h"

@interface WatchListCell ()


@end

@implementation WatchListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 115, 105)];
        self.imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.imageView];
        
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 205, 25)];
        self.label1.backgroundColor = [UIColor clearColor];
        self.label1.textColor = [UIColor whiteColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.label1];
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(120, 25, 205, 25)];
        self.label2.backgroundColor = [UIColor clearColor];
        self.label2.textColor = [UIColor whiteColor];
        self.label2.font = [UIFont italicSystemFontOfSize:12];
        [self addSubview:self.label2];
        
        self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 205, 20)];
        self.label3.backgroundColor = [UIColor clearColor];
        self.label3.textColor = [UIColor lightGrayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.label3];
        
        self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 205, 35)];
        self.label4.backgroundColor = [UIColor clearColor];
        self.label4.textColor = [UIColor redColor];
        self.label4.font = [UIFont boldSystemFontOfSize:15];
        [self addSubview:self.label4];
        
        UIImageView *accessary = [[UIImageView alloc] initWithFrame:CGRectMake(300, 45, 15, 15)];
        accessary.contentMode = UIViewContentModeScaleAspectFit;
        accessary.image = [UIImage imageNamed:@"icon_accessary"];
        [self addSubview:accessary];
    }
    return self;
}

@end
