//
//  HttpHelper.h
//  icome
//
//  Created by zhouwenbo on 15/10/30.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MethodsDefine.h"

@interface HttpHelper : NSObject
+(void)getInvestorListWithPage:(NSInteger)pageNo size:(NSInteger)size onSuccess:(SuccessBlock)successValueBlock onFailure:(FailureBlock)failureBlock;
@end
