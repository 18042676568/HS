//
//  HSFirstViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSFirstViewController.h"
#import <Parse/Parse.h>
#import "TgHeaderView.h"



@interface HSFirstViewController ()
- (IBAction)logon:(UIButton *)sender;

@property (strong, nonatomic) NSArray* wallObjectsArray;
@property (strong, nonatomic) NSMutableArray* adPicturesArray;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *image;



@end

@implementation HSFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    广告轮播器
    
    
//    从服务器上展示广告，并根据最近五条显示
    
   PFQuery *query = [PFQuery queryWithClassName:@"Advertisement"];
    

    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            self.wallObjectsArray = nil;
            self.wallObjectsArray = [[NSArray alloc] initWithArray:objects];
            [self loadWallViews];
            
        } else {
            
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
    
    
    
    
    
}


#pragma mark  打印数据库内容
-(void)loadWallViews
{
    
    _adPicturesArray = [[NSMutableArray alloc] init];
    
    //    打印数据库内容
    TgHeaderView * adView=[TgHeaderView tgHeaderView];
               adView.frame = CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 88.f);
            [self.view addSubview:adView];
//    for (PFObject * wallObject in self.wallObjectsArray){
//        
//        //Add the image
//    PFFile *image = (PFFile *)[wallObject objectForKey:@"image"];
//        
//     //   int i = 0;
////
//    //   NSString * name = [NSString stringWithFormat:@"ad_%02d",i];
//   //     i++;
//        
//        
//        
//       
////        for (int i=0; i<5; i++) {
//        [image getDataInBackgroundWithBlock: ^(NSData *PF_NULLABLE_S data, NSError *PF_NULLABLE_S error){
//            
//            if (!error) {
//                UIImage * img = [UIImage imageWithData:data];
//             [_image setImage:img];
////
////                
//               ///////TgHeaderView * adView=[TgHeaderView tgHeaderView];
////                
//                adView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 88.f);
//               [self.view addSubview:adView];
////                
//             //   [_adPicturesArray addObject:img];
//                
////                UIImageView
////                _scrollView.contentInset =
//            
// 
//                
//            } else {
//                //4
//                NSString *errorString = [[error userInfo] objectForKey:@"error"];
//                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [errorAlertView show];
//            }
//        }];
//        
////        //[query orderByDescending:@""];
////        query.limit = 1;
////        query.skip =  1;
//
//        
//            
//        //}
//
//
//        
//        
//        
//        
//    }
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logon:(UIButton *)sender {
    
//    [PFUser logInWithUsernameInBackground:@"hegf" password:@"123456" block:^(PFUser *user, NSError *error) {
//        if (user) {
//            //Open the wall
//            [self performSegueWithIdentifier:@"logon" sender:self];
//        } else {
//            //Something bad has ocurred
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
//    
//    
//    
    
    
}
@end
