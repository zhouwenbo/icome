//
//  KCStatus.m
//  YesIKnowIcome
//  微博model
//  Created by zhouwenbo on 15/10/13.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "WeiboModel.h"
#import <UIKit/UIKit.h>

@implementation WeiboModel

-(WeiboModel *)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.Id = [dic[@"Id"] longLongValue];
        self.profileImageUrl = dic[@"profileImageUrl"];
        self.userName = [dic objectForKey:@"userName"];
        self.mbtype = [dic objectForKey:@"mbtype"];
        self.createdAt = [dic objectForKey:@"createdAt"];
        self.source = [dic objectForKey:@"source"];
        self.text = [dic objectForKey:@"text"];
        
        self.sizeModel = [[SizeModel alloc] init];
        [_sizeModel setInfo:dic];
        
    }
    return self;
}


+(WeiboModel *)initWithDictionary:(NSDictionary *)dic{
    WeiboModel *kc = [[WeiboModel alloc] initWithDictionary:dic];
    return kc;
}

-(NSString *)source{
    return [NSString stringWithFormat:@"来自 %@", _source];
}

@end
