//
//  AppRestClient.m
//  icome
//
//  Created by zhouwenbo on 15/10/30.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "AppRestClient.h"
#import "AFNetworking.h"

@implementation AppRestClient

    
+(void) doPostWithURL:(NSString* ) url withParameters:(NSDictionary *) params onSuccess:(SuccessBlock)successValueBlock onFailure:(FailureBlock)failureBlock{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        successValueBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}


@end
