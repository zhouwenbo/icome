//
//  KCStatus.h
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/13.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SizeModel.h"

@interface WeiboModel : NSObject
@property(nonatomic, assign) long long Id;
@property(nonatomic, copy) NSString *profileImageUrl;
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *mbtype;
@property(nonatomic, copy) NSString *createdAt;
@property(nonatomic, copy) NSString *source;
@property(nonatomic, copy) NSString *text;

@property(nonatomic,strong)SizeModel * sizeModel;
@property(nonatomic,assign)NSInteger *count;


-(WeiboModel *)initWithDictionary:(NSDictionary *) dic;

+(WeiboModel *)initWithDictionary:(NSDictionary *) dic;

@end
