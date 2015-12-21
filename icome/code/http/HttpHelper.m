//
//  HttpHelper.m
//  icome
//
//  Created by zhouwenbo on 15/10/30.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "HttpHelper.h"
#import "AppRestClient.h"
#import "URLConfig.h"

@implementation HttpHelper

+(void)getInvestorListWithPage:(NSInteger)pageNo size:(NSInteger)size onSuccess:(SuccessBlock)successValueBlock onFailure:(FailureBlock)failureBlock{
    NSMutableDictionary *paras = [[NSMutableDictionary alloc] init];
    
    [paras setValue:[NSString stringWithFormat:@"%li", pageNo] forKey:@"page"];
    [paras setValue:[NSString stringWithFormat:@"%li", size] forKey:@"size"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",DOMAIN_URL,INVESTOR_MIX_LIST];
    [AppRestClient doPostWithURL:url withParameters:paras onSuccess:successValueBlock onFailure:failureBlock];
    
}

@end
