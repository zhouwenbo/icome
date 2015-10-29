//
//  KCContact.h
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/8.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCContact : UIViewController

//姓
@property(nonatomic, copy) NSString *firstName;
//名
@property(nonatomic, copy) NSString *lastName;
//电话号码
@property(nonatomic, copy) NSString *phoneNum;





//构造方法
-(KCContact *) initWithFirstName: (NSString *)fName andLastName:(NSString *)lName andPhoneNum :(NSString *)pNum;

//获取姓名
-(NSString *)getName;

//静态构造方法
+(KCContact *) initWithFirstName :(NSString *)fName andLastName:(NSString *)lName andPhoneNum:(NSString *)pNum;

@end
