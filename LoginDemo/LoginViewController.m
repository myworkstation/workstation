//
//  LoginViewController.m
//  LoginDemo
//
//  Created by Landon on 14-8-25.
//  Copyright (c) 2014年 Landon cop. All rights reserved.
//

#import "LoginViewController.h"
#import "loginButton.h"
#import "loginTextField.h"
#import "loginLabel.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITextField *mailBoxField = [[loginTextField alloc]initWithFrame:CGRectMake(110, 70, 190, 40)];
    UITextField *userNameField = [[loginTextField alloc]initWithFrame:CGRectMake(110, 120, 190, 40)];
    UITextField *passWordField = [[loginTextField alloc]initWithFrame:CGRectMake(110, 170, 190, 40)];
    UITextField *passWordConfirmField = [[loginTextField alloc]initWithFrame:CGRectMake(110, 220, 190, 40)];
    UITextField *telphoneField  = [[loginTextField alloc]initWithFrame:CGRectMake(110, 270, 190, 40)];
    UITextField *mobilephoneField = [[loginTextField alloc]initWithFrame:CGRectMake(110, 320, 190, 40)];
    
    UIButton *confirmButton = [[loginButton alloc]initWithFrame:CGRectMake(110, 450, 100, 40)];
    
    UILabel *mailText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 70, 100, 40)];
    UILabel *nameText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 120, 100, 40)];
    UILabel *passwordText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 170, 100, 40)];
    UILabel *passwordconfirmText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 220, 100, 40)];
    UILabel *telphoneText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 270, 100, 40)];
    UILabel *mobilephoneText = [[loginLabel alloc]initWithFrame:CGRectMake(10, 320, 100, 40)];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, 200, 40)];
    title.text = @"Regist for XZPSpace!";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor redColor];
    
    
    mailText.text = @"EmailAddress:";
    nameText.text = @"Username:";
    passwordText.text = @"Password:";
    passwordconfirmText.text = @"confirm psd:";
    telphoneText.text = @"Telephone:";
    mobilephoneText.text = @"Mobilephone:";
    
    [confirmButton setTitle:@"confirm!" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(onclickbtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.mailBoxField = mailBoxField;
    self.userNameField = userNameField;
    self.passWordField = passWordField;
    self.passWordConfirmField = passWordConfirmField;
    self.telphoneField = telphoneField;
    self.mobilephoneField = mobilephoneField;
    
    self.confirmButton = confirmButton;
    
    mailBoxField.delegate = self;
    userNameField.delegate = self;
    passWordConfirmField.delegate = self;
    passWordField.delegate = self;
    telphoneField.delegate = self;
    mobilephoneField.delegate = self;
    
    [self.view addSubview:mailBoxField];
    [self.view addSubview:userNameField];
    [self.view addSubview:passWordField];
    [self.view addSubview:passWordConfirmField];
    [self.view addSubview:telphoneField];
    [self.view addSubview:mobilephoneField];
    
    [self.view addSubview:confirmButton];
    [self.view addSubview:title];
    
    [self.view addSubview:mailText];
    [self.view addSubview:nameText];
    [self.view addSubview:passwordText];
    [self.view addSubview:passwordconfirmText];
    [self.view addSubview:telphoneText];
    [self.view addSubview:mobilephoneText];
    
    ///---------------------------------------
    ///-------------验证
    self.mailBoxField.layer.borderWidth=1;
    self.userNameField.layer.borderWidth=1;
    self.passWordField.layer.borderWidth=1;
    self.passWordConfirmField.layer.borderWidth=1;
    self.telphoneField.layer.borderWidth=1;
    self.mobilephoneField.layer.borderWidth=1;
    
    RAC(self.mailBoxField.layer,borderColor)=[RACSignal combineLatest:@[self.mailBoxField.rac_textSignal]
                                                               reduce: ^id(NSString *email){return [email isMatchedByRegex:@"[A-Z0-9a-z_]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}"]?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.userNameField.layer,borderColor)=[RACSignal combineLatest:@[self.userNameField.rac_textSignal]
                                                               reduce: ^id(NSString *username){return [username isMatchedByRegex:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,16}$"]?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.passWordField.layer,borderColor)=[RACSignal combineLatest:@[self.passWordField.rac_textSignal]
                                                                reduce: ^id(NSString *password){return [password isMatchedByRegex:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"]?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.passWordConfirmField.layer,borderColor)=[RACSignal combineLatest:@[self.passWordField.rac_textSignal,self.passWordConfirmField.rac_textSignal]
                                                                reduce: ^id(NSString *password,NSString *confirmpsd){return ([confirmpsd isEqualToString:password]&&confirmpsd.length>0)?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.telphoneField.layer,borderColor)=[RACSignal combineLatest:@[self.telphoneField.rac_textSignal,self.mobilephoneField.rac_textSignal]
                                                                reduce: ^id(NSString *telephone,NSString *mobilephone){return ([telephone isMatchedByRegex:@"^[0-9]{4}-[0-9]{8}$|^[0-9]{4}-[0-9]{7}$|^[0-9]{3}-[0-9]{8}$|^[0-9]{3}-[0-9]{7}$"]||[mobilephone isMatchedByRegex:@"^[0-9]{11}$"])?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.mobilephoneField.layer,borderColor)=[RACSignal combineLatest:@[self.telphoneField.rac_textSignal,self.mobilephoneField.rac_textSignal]
                                                                reduce: ^id(NSString *telephone,NSString *mobilephone){return ([telephone isMatchedByRegex:@"^[0-9]{4}-[0-9]{8}$|^[0-9]{4}-[0-9]{7}$|^[0-9]{3}-[0-9]{8}$|^[0-9]{3}-[0-9]{7}$"]||[mobilephone isMatchedByRegex:@"^[0-9]{11}$"])?[UIColor blueColor].CGColor:[UIColor redColor].CGColor;}];
    
    RAC(self.confirmButton,enabled)=[RACSignal combineLatest:@[self.mailBoxField.rac_textSignal,self.userNameField.rac_textSignal,self.passWordField.rac_textSignal,self.passWordConfirmField.rac_textSignal,self.telphoneField.rac_textSignal,self.mobilephoneField.rac_textSignal] reduce:^(NSString *email,NSString *username,NSString *password,NSString *confirmpsd,NSString *telephone,NSString *mobilephone){
        return @([email isMatchedByRegex:@"[A-Z0-9a-z_]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}"]
        &&[username isMatchedByRegex:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,16}$"]
        &&[password isMatchedByRegex:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"]
        &&[confirmpsd isEqualToString:password]
        &&([telephone isMatchedByRegex:@"^[0-9]{4}-[0-9]{8}$|^[0-9]{4}-[0-9]{7}$|^[0-9]{3}-[0-9]{8}$|^[0-9]{3}-[0-9]{7}$"]||[mobilephone isMatchedByRegex:@"^[0-9]{11}$"])
        );
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)onclickbtn:(id)sender
{
    self.mailBoxField.text=@"";
    self.userNameField.text=@"";
    self.passWordField.text=@"";
    self.passWordConfirmField.text=@"";
    self.telphoneField.text=@"";
    self.mobilephoneField.text=@"";
    
    self.confirmButton.enabled=NO;
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Regist Information" message:@"Congratulations! You have regist successful!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
    [alert show];
}

@end
