//
//  OcDtVC1.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/20.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "OcDtVC1.h"
#import "OcDtVC2.h"
#import "icome-Swift.h"

@interface OcDtVC1(){
    
    IBOutlet UITextField *text1;
    
    IBOutlet UITextField *text2;
}

@end

@implementation OcDtVC1

- (IBAction)toVC2:(UIButton *)sender {
    
    
    OcDtVC2 *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"OcDtVC2"];
    NSString *s1 = text1.text;
    NSString *s2 = text2.text;
    if ([StringUtils isEmpty:s1] || [StringUtils isEmpty:s2]) {
        NSLog(@"str is  null");
    } else {
        vc2.textDelegate = self;
        vc2.str1 = s1;
        vc2.str2 = s2;
        [self.navigationController pushViewController:vc2 animated:true];
    }
    
    
}

-(void) setText:(NSString *)str {
    
}

@end
