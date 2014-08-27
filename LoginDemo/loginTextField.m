//
//  loginTextField.m
//  LoginDemo
//
//  Created by Landon on 14-8-25.
//  Copyright (c) 2014年 Landon cop. All rights reserved.
//

#import "loginTextField.h"

@implementation loginTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.4 green:0.6 blue:0.3 alpha:0.5];
        [self setBorderStyle:UITextBorderStyleRoundedRect];
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
