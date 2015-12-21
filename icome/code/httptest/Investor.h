//
//  Investor.h
//  icome
//
//  Created by zhouwenbo on 15/11/2.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Investor : NSObject

@property(nonatomic, copy) NSString *userId;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *headImg;

@property(nonatomic, copy)NSString *companyName;

@property(nonatomic, assign)NSInteger vipLevel;


-(instancetype) initWithDictionary:(NSDictionary *)dic;

@end
