//
//  QQChatMsgBar.m
//  UI14-QQ
//
//  Created by neuedu on 15/8/27.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "QQChatMsgBar.h"

@implementation QQChatMsgBar

+(instancetype)qqChatMsgBar{
    QQChatMsgBar *msgBar = [[[NSBundle mainBundle]loadNibNamed:@"QQChatSenderMsgBar" owner:nil options:nil]lastObject];
    return msgBar;
}
- (IBAction)sendMsg:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(didSEnderMsgCick:)]) {
        if (_messagetext.text.length == 0) {
            //sender.enabled = YES;
            return;
        }else{
            [_delegate didSEnderMsgCick:_messagetext.text];
            _sendButon.enabled = NO;
        }
    }  
    _messagetext.text =@"";
    //[_messagetext resignFirstResponder];
    
    //光标继续停留在textfield便于继续输入
    //[_messagetext becomeFirstResponder];
    //[self.view.window endEditing:YES];
    
}

//编辑结束并退出时（return）
- (IBAction)endExit:(UITextField *)sender {
    NSLog(@"end");
    [sender resignFirstResponder];
    

}

//编辑结束时调用 （比如两个textFild光标切换或者 return）
- (IBAction)editdidEnd:(UITextField *)sender {
    //[sender resignFirstResponder];
}
- (IBAction)textChanged:(UITextField *)sender {
    if (sender.text.length == 0) {
        _sendButon.enabled = NO;
    }else if(!_sendButon.enabled){
        _sendButon.enabled = YES;
    }
}

- (IBAction)textBegin:(UITextField *)sender {
    if (sender.text.length == 0) {
        
        _sendButon.enabled = NO;
    }

}
@end
