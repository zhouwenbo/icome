//
//  WeiboTableViewCell.h
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/13.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"

#define WeiboTableViewCell_H  150

@interface WeiboTableViewCell : UITableViewCell

@property(nonatomic, strong) WeiboModel* model;
@property(nonatomic, assign) CGFloat height;

@end
