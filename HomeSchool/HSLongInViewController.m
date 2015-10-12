//
//  HSLongInViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSLongInViewController.h"
#import <Parse/Parse.h>
#import "HSPhotoWallTableViewController.h"


@interface HSLongInViewController ()
- (IBAction)login:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signIn:(UIButton *)sender;


@end

@implementation HSLongInViewController

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

- (IBAction)login:(UIButton *)sender {
    
    
//    [self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
    
    
//    ChatTableViewController* chatVC = [[ChatTableViewController alloc]init];
//    [self.navigationController pushViewController:chatVC animated:YES];
    
    
    
//    HSUpPhotoAndComentViewController * cha = [[HSUpPhotoAndComentViewController alloc]init];
//    
//    [self.navigationController pushViewController:cha animated:YES];
   
    
//    1
    
//    HSPhotoWallTableViewController * wall = [[HSPhotoWallTableViewController alloc]init];
//    
//    [self.navigationController pushViewController:wall animated:YES];
//
    
    
//    2
    
    
//    [PFUser logInWithUsernameInBackground:@"hegf" password:@"123456" block:^(PFUser *user, NSError *error) {
//        if (user) {
//            //Open the wall
//            [self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
//        } else {
//            //Something bad has ocurred
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
//    
    
    
    
    
    
    
    
    
//    
//    [PFUser logInWithUsernameInBackground:self.userTextField.text password:self.passwordTextField.text block:^(PFUser *user,NSError *error){
//        if(user){ //open the wall
//            [self performSegueWithIdentifier:@"LoginSuccesful"sender:self];
//        
//        
//        
//        }
//        
//        else{
//                //something wrong
//                NSString *errorString = [[error userInfo]objectForKey:@"error"];
//                UIAlertView *errorAlertView = [[UIAlertView alloc]initWithTitle:@"Error"message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [errorAlertView show];
//            }
//    }];
//    
    
    
}

- (IBAction)signIn:(UIButton *)sender {
    
    
//     [self performSegueWithIdentifier:@"toSignUp"sender:self];
    
}
@end
