//
//  SHStatusBarHUD.h
//  SHStatusBarHUD
//
//  Created by admin on 16/1/31.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHStatusBarHUD : NSObject
+ (void)showMessage:(NSString *)msg;
+ (void)showSucess:(NSString *)msg withImage:(UIImage *)image;
+ (void)showError:(NSString *)msg withImage:(UIImage *)image;
+ (void)showLoading:(NSString *)msg;
+ (void)hide;
@end
