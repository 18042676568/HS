//
//  HSLoginViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSLoginViewController.h"
#import "HSMainPageViewController.h"
#import "ACSimpleKeychain.h"
#import <Parse/Parse.h>
#import <MBProgressHUD.h>
#import "MBProgressHUD+MoreExtentions.h"

@interface HSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *storepwd;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@end

@implementation HSLoginViewController
- (IBAction)storepwd:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //从keychain取用户名和密码 如果取到 则自定填充到_userName _passWord.
    [self featchUserNamePwd];
}

#pragma mark 从keychain取用户名和密码 如果取到 则自定填充到_userName _passWord
- (void)featchUserNamePwd{
    NSDictionary* userPwdDict =  [[ACSimpleKeychain defaultKeychain] credentialsForIdentifier:@"user1" service:@"userpassword"];
    
    if (userPwdDict!= nil) {
        _storepwd.selected = YES;
        _phone.text = [userPwdDict valueForKey:ACKeychainUsername];
        _pwd.text = [userPwdDict valueForKey:ACKeychainPassword];
    }
    if (_phoneNumber.length == 11) {
        _storepwd.selected = NO;
        _phone.text = _phoneNumber;
        _pwd.text = @"";
    }

}

- (IBAction)login:(UIButton *)sender {
    
    if (_phone.text.length == 0) {
        [MBProgressHUD showTipToWindow:@"手机号不能为空"];
    }
    else
    {
        if (_pwd.text.length == 0) {
            [MBProgressHUD showTipToWindow:@"密码不能为空"];
        }
        else{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            [PFUser logInWithUsernameInBackground:_phone.text password:_pwd.text
                                            block:^(PFUser *user, NSError *error) {
                                                if (user) {
                                                    PFUser* curUser = [PFUser currentUser];
                                                    [curUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                                        if (succeeded) {
                                                            if(_storepwd.selected == YES){
                                                                [[ACSimpleKeychain defaultKeychain] storeUsername:_phone.text password:_pwd.text identifier:@"user1" forService:@"userpassword"];
                                                            }
                                                            else
                                                            {
                                                                [[ACSimpleKeychain defaultKeychain] deleteAllCredentialsForService:@"userpassword"];
                                                            }
                                                            
                                                            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                                            
                                                            HSMainPageViewController *mainPage = [[HSMainPageViewController alloc]init];
                                                            [UIApplication sharedApplication].keyWindow.rootViewController = mainPage;
                                                            
                                                        } else {
                                                            //Something bad has occurred
                                                            NSString *errorString = [[error userInfo] objectForKey:@"error"];
                                                            [MBProgressHUD showTipToWindow:errorString];                                                          [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                                        }
                                                    }];
                                                    
                                                } else {
                                                    //Something bad has occurred
                                                    NSString *errorString = [[error userInfo] objectForKey:@"error"];
                                                    [MBProgressHUD showTipToWindow:errorString];                                                                                                           [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                                                }
                                            }];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
