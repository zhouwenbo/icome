//
//  KCContact.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/8.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact


-(KCContact *)initWithFirstName:(NSString *)fName andLastName:(NSString *)lName andPhoneNum:(NSString *)pNum{
    if (self == [super init]) {
        self.firstName = fName;
        self.lastName = lName;
        self.phoneNum = pNum;
    }
    return self;
}

-(NSString *)getName {
     return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

+(KCContact *)initWithFirstName:(NSString *)fName andLastName:(NSString *)lName andPhoneNum:(NSString *)pNum{
    KCContact *kccontact = [[KCContact alloc] initWithFirstName:fName andLastName:lName andPhoneNum:pNum];
    return kccontact;
}

@end
