//
//  HSUpPhotoAndComentViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSUpPhotoAndComentViewController.h"
#import <Parse/Parse.h>




@interface HSUpPhotoAndComentViewController ()


@property (weak, nonatomic) IBOutlet UITextField *commentTextFiel;
- (IBAction)upPhotoAndComent:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img;
- (IBAction)selectPicturePressed:(UIButton *)sender;




@end

@implementation HSUpPhotoAndComentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    
//    UITextField * text = [[UITextField alloc] init];
//    _commentTextFiel = text;
//    text.frame = CGRectMake(44.f, 88.f, 100.f, 44.f);
//    
//    text.borderStyle = UITextBorderStyleLine;
//    
//    
//    
//    
//    
//    
//    
//    
//    UIImageView * view = [[UIImageView alloc]init];
//    _img = view;
//    
//    view.frame =CGRectMake(44.f, 200.f, 100.f, 100.f);
//    
//    
//    
//    
//    UIButton * selectPicture = [[UIButton alloc] init];
//    selectPicture.frame = CGRectMake(44.f, 140.f, 45.f, 44.f);
//    selectPicture.titleLabel.text=@"选择图片";
//    //selectPicture.titleLabel.textColor = [UIColor blackColor];
//    //[selectPicture setTitle:<#(NSString *)#> forState:<#(UIControlState)#>]
//    [selectPicture setTitle:@"选择图片" forState:UIControlStateNormal];
//    [selectPicture setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    
//    
//  //  [selectPicture addTarget:<#(id)#> action:<#(SEL)#> forControlEvents:<#(UIControlEvents)#>]
//    [selectPicture addTarget:self action:@selector(selectPicturePressed:)  forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    
//    
//    
//    
//    UIButton * upPictureAndComment = [[UIButton alloc]init];
//    upPictureAndComment.frame =CGRectMake(100.f, 140.f, 45.f, 44.f);
////    upPictureAndComment.titleLabel.text=@"上传";
////    upPictureAndComment.titleLabel.textColor = [UIColor blackColor];
//    
//    [upPictureAndComment setTitle:@"上传" forState:UIControlStateNormal];
//    [upPictureAndComment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    
//    
//    [upPictureAndComment addTarget:self action:@selector(upPhotoAndComent:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    [self.view addSubview:upPictureAndComment];
//    [self.view addSubview:selectPicture];
//    [self.view addSubview:text];
//    [self.view addSubview:view];
//    
    
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
//
- (IBAction)upPhotoAndComent:(UIButton *)sender {
//
//    
//   [self.commentTextFiel dresignFirstResponder];
    
    
//  /  [self.commentTextFiel description]
//
    NSString * comment = self.commentTextFiel.text;
    
    
    
    UIImage * image = _img.image;
    NSData* pictureData  = UIImagePNGRepresentation(image);
    PFFile *file = [PFFile fileWithName:@"image" data:pictureData];

    
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded){
            //2
            //Add the image to the object, and add the comment and the user
            
            
          PFObject *imageObject = [PFObject objectWithClassName:@"PhotoAndComent"];
            [imageObject setObject:file forKey:@"image"];
              [imageObject setObject:[PFUser currentUser].username forKey:@"user"];
            
            [imageObject setObject:comment forKey:@"comment"];
            //3
            [imageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                //4
                if (succeeded){
                    //Go back to the wall
                    //[self.navigationController popViewControllerAnimated:YES];
                    NSLog(@"upload Success");
                }
                else{
                    NSString *errorString = [[error userInfo] objectForKey:@"error"];
                    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [errorAlertView show];
                }
            }];
        }
        else{
            //5
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    } progressBlock:^(int percentDone) {
        NSLog(@"Uploaded: %d %%", percentDone);
    }];
    
    
    
    
    
    
    
    
//    
//    //Disable the send button until we are ready self.navigationItem.rightBarButtonItem.enabled = NO;
//    //Place the loading spinner
//    UIActivityIndicatorView *loadingSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [loadingSpinner setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)];
//    [loadingSpinner startAnimating]; [self.view addSubview:loadingSpinner];
//    //TODO: Upload a new picture
////   NSData *pictureData = UIImagePNGRepresentation(self.imgToUpload.image);
////    
//    
//    
//    
//    
//    
//    
    
}


- (IBAction)selectPicturePressed:(UIButton *)sender {
    
    
    //Open a UIImagePickerController to select the picture
    UIImagePickerController *imgPicker =[[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
   // [self.navigationController presentModalViewController:imgPicker animated:YES];
    //模态转换页面
    [self presentViewController:imgPicker animated:YES completion:nil];
    
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

 UIImage * image =info[UIImagePickerControllerOriginalImage];
    
     [_img setImage:image];

}




@end
