//
//  Investor.m
//  icome
//
//  Created by zhouwenbo on 15/11/2.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "Investor.h"

@interface Investor(){
    
    
}
@end

@implementation Investor

//get method
-(NSString *) companyName{
    return @"北京正和岛创典科技有限公司";
}


-(instancetype)initWithDictionary:(NSDictionary *)dic{
    if(self = [super init]){
        self.userId = [dic objectForKey:@"user_id"];
        self.name = [dic objectForKey:@"user_name"];
        self.headImg = [dic objectForKey:@"user_avatar"];
        self.companyName = [dic objectForKey:@"company_name"];
        NSString *str = [dic objectForKey:@"vip_level"];
        if (str && str.length > 0) {
            self.vipLevel = [str intValue];
        } else{
            self.vipLevel = 0;
        }
    }
    
    return self;
}



@end
