//
//  ViewController.m
//  LoaclSokcet
//
//  Created by yisanmao on 15/9/11.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import "ViewController.h"
#import "LocalSocket.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) LocalSocket *socket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.socket = [[LocalSocket alloc] init];
    int clientFd = [self.socket createSockets];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        static char recv_buf[1024];
        
        while (1)
        {
            memset(recv_buf, 0, 1024);
            read(clientFd, recv_buf, 1024);
            
            NSData *data = [NSData dataWithBytes:recv_buf length:strlen(recv_buf)];
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%s__%@", recv_buf, str);
        }
    });
}

- (IBAction)send:(id)sender
{
    NSString *str = self.textField.text;
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.socket sendData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
