//
//  HSResignViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSResignViewController.h"
#import "PooCodeView.h"
#import "UIView+Extension.h"
#import <Parse/Parse.h>
#import "HSLoginViewController.h"
#import <MBProgressHUD.h>

@interface HSResignViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *risign;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *identifyCode;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIView *identify;
@property (nonatomic,strong)PooCodeView *codeView;
@end

@implementation HSResignViewController
- (IBAction)resign:(UIButton *)sender {
    if ([_codeView.changeString compare:_identifyCode.text options:NSCaseInsensitiveSearch | NSNumericSearch]==0) {
        if([self checkTel:_phone.text]&&_pwd.text.length!=0){
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            PFUser *user = [PFUser user];
            //2
            user.username = _phone.text;
            user.password = _pwd.text;
            
            //3
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"注册结果" message:@"恭喜您注册成功" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [errorAlertView show];
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    [self performSegueWithIdentifier:@"tologon" sender:_phone.text];
                    
                    //_risign.enabled = YES;
                } else {
                    //Something bad has occurred
                    NSString *errorString = [[error userInfo] objectForKey:@"error"];
                    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"注册失败" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [errorAlertView show];
                    //_risign.enabled = YES;
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                }
            }];

        }
    }else{
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"警告" message:@"验证码错误" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alview show];
        [self.view endEditing:NO];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[HSLoginViewController class]]) {
        HSLoginViewController *log = segue.destinationViewController;
        log.phoneNumber = sender;
    }
}
#pragma mark 手机号验证
-(BOOL)checkTel:(NSString *)str{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        return NO;
        
    }
    return YES;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PooCodeView *poo = [[PooCodeView alloc]initWithFrame:CGRectMake(_identify.left, _identify.top, _identify.width, _identify.height)];
    _codeView = poo;
    [self.view addSubview:poo];
    
    int result1 = [@"This is John" compare:@"this is John" options:NSCaseInsensitiveSearch | NSNumericSearch];
    NSLog(@"The result is %d",result1);
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
