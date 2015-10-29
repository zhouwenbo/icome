//
//  OcDtVC2.h
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/20.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol SetTextDelegate <NSObject>
-(void) setText:(NSString *)str;
@end


@interface OcDtVC2 : UIViewController

@property(nonatomic, copy)NSString *str1;

@property(nonatomic, copy)NSString *str2;

@property (nonatomic,assign)id<SetTextDelegate> textDelegate;

@end



