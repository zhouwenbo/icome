//
//  OcDtVC2.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/20.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "OcDtVC2.h"
#import "icome-Swift.h"

@interface OcDtVC2() {
    
    IBOutlet UITextField *backText;

    IBOutlet UITextField *text1;
    
    IBOutlet UITextField *text2;
    
    
}

@end

@implementation OcDtVC2


-(void) viewDidLoad{
    text1.text = _str1;
    text2.text = _str2;
}

- (IBAction)backToVC1:(UIButton *)sender {
    NSString *str = backText.text;
    if ([StringUtils isEmpty:str]) {
        NSLog(@"str is null");
    } else {
        if (_textDelegate != nil) {
            [_textDelegate setText:str];
        }
        [self.navigationController popToRootViewControllerAnimated:true];
    }
    
    
}

@end
