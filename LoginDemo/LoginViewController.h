//
//  LoginViewController.h
//  LoginDemo
//
//  Created by Landon on 14-8-25.
//  Copyright (c) 2014年 Landon cop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"
#import "RegexKitLite.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *mailBoxField;
@property (nonatomic,strong) UITextField *userNameField;
@property (nonatomic,strong) UITextField *passWordField;
@property (nonatomic,strong) UITextField *passWordConfirmField;
@property (nonatomic,strong) UITextField *telphoneField;
@property (nonatomic,strong) UITextField *mobilephoneField;

@property (nonatomic,strong) UIButton *confirmButton;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
