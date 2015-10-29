//
//  KCContactGroup.h
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/8.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContactGroup : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *detail; //字符串 copy

@property(nonatomic, strong) NSMutableArray *contacts; //引用类型 用strong

@property(nonatomic, assign) NSInteger age;  //基本数据类型 assign



-(KCContactGroup *) initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

+(KCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;



@end
