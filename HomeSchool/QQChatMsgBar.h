//
//  QQChatMsgBar.h
//  UI14-QQ
//
//  Created by neuedu on 15/8/27.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QQChatMsgBarDelegate<NSObject>
@required
-(void)didSEnderMsgCick:(NSString *)str;
@end

@interface QQChatMsgBar : UIView
@property (weak, nonatomic) IBOutlet UITextField *messagetext;
- (IBAction)endExit:(id)sender;
- (IBAction)editdidEnd:(UITextField *)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButon;
- (IBAction)textChanged:(id)sender;
- (IBAction)textBegin:(UITextField *)sender;

@property (weak,nonatomic)id <QQChatMsgBarDelegate>delegate;
+(instancetype)qqChatMsgBar;
@end
