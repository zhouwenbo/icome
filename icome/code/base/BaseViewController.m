//
//  BaseViewController.m
//  icome
//
//  Created by zhouwenbo on 15/11/23.
//  Copyright © 2015年 zhouwenbo. All rights reserved.

#define BASE_NAV_BGCOLOR   [UIColor colorWithRed:231/255.0f green:32/255.0f blue:32/255.0f alpha:1.000]    //导航栏背景色

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self base_changeNavigationBarBackgroudColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (void)base_changeNavigationBarBackgroudColor{
    self.navigationController.navigationBar.translucent = NO;    // Bar的模糊效果，默认为YES
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];  // 这个配合改变导航栏颜色
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        CGSize imageSize = CGSizeMake(self.navigationController.navigationBar.frame.size.width,64);
        UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
        [BASE_NAV_BGCOLOR set];
        UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
        UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [self.navigationController.navigationBar setBackgroundImage:pressedColorImg forBarMetrics:UIBarMetricsDefault];
    }

}


@end
