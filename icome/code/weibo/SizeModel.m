//
//  SizeModel.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/16.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "SizeModel.h"
#import <UIKit/UIKit.h>

@implementation SizeModel

-(void)setInfo:(NSDictionary *)info{

    if (info == nil) {
        return;
    }
    CGSize userNameSize=[[info objectForKey:@"userName"] sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    self.nameWidth =userNameSize.width;
}

@end
