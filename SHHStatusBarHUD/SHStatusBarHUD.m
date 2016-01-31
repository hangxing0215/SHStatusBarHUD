//
//  SHStatusBarHUD.m
//  SHStatusBarHUD
//
//  Created by admin on 16/1/31.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "SHStatusBarHUD.h"
#define SHMsgTextFont [UIFont systemFontOfSize:12]
#define SHTimeInterval 0.25
@implementation SHStatusBarHUD
static UIWindow *window_;
static NSTimer *timer_;
+ (void)showWindow
{
    //frame 数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden = YES;
    //显示窗口
    window_ = [[UIWindow alloc]init];
    //   UIWindowLevelNormal < UIWindowLevelStatusBar < UIWindowLevelAlert
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:SHTimeInterval animations:^{
        window_.frame = frame;
        
    } ];
    
}
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image
{
    //显示窗口
    [self showWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.userInteractionEnabled = NO;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    button.frame = window_.bounds;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [window_ addSubview:button];
}
+(void)showSucess:(NSString *)msg withImage:(UIImage *)image
{
    [self showMessage:msg withImage:image];
}
+(void)showError:(NSString *)msg withImage:(UIImage *)image
{
    [self showMessage:msg withImage:image];
}
+(void)showLoading:(NSString *)msg
{
    [self showWindow];
    //添加文本
    UILabel *label = [[UILabel alloc]init];
    label.frame = window_.bounds;
    label.font = SHMsgTextFont;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loudingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loudingView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : SHMsgTextFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) / 2 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loudingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loudingView];
    
}
+ (void)showMessage:(NSString *)msg
{
    //定时器销毁
    [timer_ invalidate];
    
    [self showMessage:msg withImage:nil];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
+(void)hide
{
    [UIView animateWithDuration:SHTimeInterval animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
        
        
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    
}


@end
