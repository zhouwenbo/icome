//
//  KCContactGroup.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/8.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup

-(KCContactGroup *) initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+(KCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    KCContactGroup *group = [[KCContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return group;
}

@end
