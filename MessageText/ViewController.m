//
//  ViewController.m
//  MessageText
//
//  Created by Civet on 2019/4/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMessageComposeViewControllerDelegate>
@property(nonatomic) MFMessageComposeViewController *con;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _con = [[MFMessageComposeViewController alloc]init];
    if ([MFMessageComposeViewController canSendText]){
        _con.messageComposeDelegate = self;
        _con.recipients = @[@"11111111111111"];
        _con.body = @"发送信息";
        _con.subject = @"信息标题";
    }
    [self presentViewController:_con animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"取消发送");
            break;
        case MessageComposeResultFailed:
            NSLog(@"发送失败");
            break;
        case MessageComposeResultSent:
            NSLog(@"发送成功");
            break;
        default:
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
