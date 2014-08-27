//
//  loginLabel.m
//  LoginDemo
//
//  Created by Landon on 14-8-25.
//  Copyright (c) 2014年 Landon cop. All rights reserved.
//

#import "loginLabel.h"

@implementation loginLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor blackColor];
        self.textAlignment =NSTextAlignmentLeft ;
    }
    return self;
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
