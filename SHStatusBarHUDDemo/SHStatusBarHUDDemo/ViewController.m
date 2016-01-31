//
//  ViewController.m
//  SHStatusBarHUDDemo
//
//  Created by admin on 16/1/31.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "SHStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)message:(id)sender
{
    [SHStatusBarHUD showMessage:@"一般提醒"];
}

- (IBAction)hide:(id)sender
{
    [SHStatusBarHUD hide];
}
- (IBAction)loading:(id)sender
{
    [SHStatusBarHUD showLoading:@"正在加载..."];
}
- (IBAction)error:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"SHImage.bundle/error"];
    [SHStatusBarHUD showError:@"失败" withImage:image];
}
- (IBAction)success:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"SHImage.bundle/success"];
    [SHStatusBarHUD showSucess:@"成功" withImage:image];
}


@end
