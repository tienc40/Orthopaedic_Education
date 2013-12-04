//
//  Z115StarButton.m
//  Orthopaedic
//
//  Created by TienT on 11/29/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115StarButton.h"
#import "Z115WordPressPost.h"

@implementation Z115StarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)switchStar
{
    if ([self.currentBackgroundImage isEqual:[UIImage imageNamed:@"star1.png"]]) {
        [self setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];

    } else {
        [self setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
