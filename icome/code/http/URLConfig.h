//
//  URLConfig.h
//  icome
//
//  Created by zhouwenbo on 15/11/2.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
//测试环境标识符
#define SERVICE_TEST = 1
//线上环境标识符
#define SERVICE_ONLINE = 2

#define CURRENT_SERVICE = SERVICE_TEST
//测试环境
#define DOMAIN_URL  @"http://v3.ichuangdian.com/?"
//线上环境
//#define Domain_URL = @"http://duilu.ichuangdian.com/?"

#define INVESTOR_MIX_LIST @"c=investment&m=investor_mix_list"
//
//#define GET_INVESTOR_LIST [NSString stringWithFormat:@"%@%@",DOMAIN_URL,@"c=investment&m=investor_mix_list"];





