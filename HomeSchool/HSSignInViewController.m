//
//  HSSignInViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSSignInViewController.h"
#import <Parse/Parse.h>

@interface HSSignInViewController ()
- (IBAction)signIn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *userRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordRegisterTextField;

@end

@implementation HSSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)signIn:(UIButton *)sender {
    
    //1
    PFUser *user =[PFUser user];
    //2
    user.username = self.userRegisterTextField.text;
    user.password = self.passwordRegisterTextField.text;
    //3
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            //The registration was successful, go to the wall
            [self performSegueWithIdentifier:@"SignupSuccesful"sender:self];
        }else{
            //something bad has occured
            NSString *errorString = [[error userInfo]objectForKey:@"error"];
            
            
            
            UIAlertView *errorAlertView =[[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            
            
            
            [errorAlertView show]; }
    }];
    
    
//    根据注释编号来看看以上代码的作用:
//    1. 创建一个新的对象PFUser。该类将用于登陆和注册流程。它将保存已获验证的用户,同时 也可以让开发者在需要的时候获取该用户的数据。
//    2. 指定用户名和密码为视图中TextFields中的字段值。
//    3. 调用方法在后台注册用户,并在块中检查注册结果。如果注册成功,就转向照片墙视图。如 果不是,则会返回一个错误描述。
//
    
    
    
}
@end
