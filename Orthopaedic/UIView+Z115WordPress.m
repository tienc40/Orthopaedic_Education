//
//  UIView+Z115WordPress.m
//  Orthopaedic
//
//  Created by TienT on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "UIView+Z115WordPress.h"

@implementation UIView (Z115WordPress)
+ (instancetype)viewFromNib
{
    UIView *customView = nil;
    NSArray *elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    
    for (id anObject in elements)
    {
        if ([anObject isKindOfClass:[self class]])
        {
            customView = anObject;
            break;
        }
    }
    
    return customView;
}

- (void)circleTheSquare:(UIColor *)edgeColor
{
    self.layer.borderColor = edgeColor.CGColor;
    self.layer.borderWidth = 2.0f;
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
}
@end
