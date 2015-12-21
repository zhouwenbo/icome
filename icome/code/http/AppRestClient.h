//
//  AppRestClient.h
//  icome
//
//  Created by zhouwenbo on 15/10/30.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MethodsDefine.h"

@interface AppRestClient : NSObject

+(void) doPostWithURL:(NSString* ) url withParameters:(NSDictionary *) params onSuccess:(SuccessBlock)successValueBlock onFailure:(FailureBlock)failureBlock;



//
///**
// *  POST 上传文件
// *
// *  @param requestURLString 请求地址
// *  @param parameters       参数集合
// *  @param fileData         文件的数据data
// *  @param valueBlock       成功格式的数据返回
// *  @param errorBlock       错误的数据返回
// *  @param failureBlock     非法+失败的数据返回
// */
//+(void)netRequestPOSTDataWithRequestURL: (NSString *) requestURLString
//                          WithParameter: (NSDictionary *) parameters
//                           WithFileData: (NSData *) fileData
//                   WithReturnValeuBlock:(SuccessBlock)successValueBlock
//                       WithFailureBlock:(FailureBlock)failureBlock;


@end
