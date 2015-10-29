//
//  WeiboTableViewCell.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/13.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "WeiboTableViewCell.h"
#define BaseColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]
//#define KCColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜//色宏定义
#define weiboTableViewCellControlSpacing 10


@interface WeiboTableViewCell(){
    UIImageView *_avatar;
    UIImageView *_mbType;
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
    
}
@end

@implementation WeiboTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    
    return self;
}


-(void) initSubView {
    //头像
    _avatar = [[UIImageView alloc] init];
    CGRect rect = CGRectMake(10, 10, 40, 40);
    _avatar.frame = rect;
    [self addSubview:_avatar];
    
    //vip标识图片
    _mbType = [[UIImageView alloc] init];
    [self addSubview:_mbType];
    
    //userName
    _userName = [[UILabel alloc] init];
    _userName.textColor = BaseColor(50, 50, 50);
    _userName.font = [UIFont systemFontOfSize:14];
    [self addSubview:_userName];
    
    //创建时间
    _createAt = [[UILabel alloc] init];
    _createAt.textColor = BaseColor(120, 120, 120);
    _createAt.font = [UIFont systemFontOfSize:12];
    [self addSubview:_createAt];
    
    //来自
    _source = [[UILabel alloc] init];
    _source.textColor = BaseColor(120, 120, 120);
    _source.font = [UIFont systemFontOfSize:12];
    [self addSubview:_source];
    
    //文本
    _text = [[UILabel alloc] init];
    _text.textColor = BaseColor(50, 50, 50);
    _text.font = [UIFont systemFontOfSize:12];
    _text.numberOfLines = 0;
    [self addSubview:_text];
    
}

-(void) setModel:(WeiboModel *) model {
    
    //头像
    _avatar.image = [UIImage imageNamed:model.profileImageUrl];
    
    //名字
    _userName.text=model.userName;
    
    CGRect userNameRect=CGRectMake(CGRectGetMaxX(_avatar.frame)+10, 10, model.sizeModel.nameWidth,20);
    _userName.frame=userNameRect;
    
    //vip标识
    _mbType.image=[UIImage imageNamed:model.mbtype];
    
    //发布时间
    _createAt.text=model.createdAt;
    
    //设置设备信息大小和位置
    _source.text=model.source;
    
    //设置微博内容大小和位置
    _text.text=model.text;
    
}

-(void)layoutSubviews{

    [super layoutSubviews];
    NSLog(@"layoutSubviews");

    CGRect mbTypeRect=CGRectMake(CGRectGetMaxX(_userName.frame)+10, 10, 13, 13);
    _mbType.frame=mbTypeRect;

    CGSize createAtSize=[_createAt.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    CGRect createAtRect=CGRectMake(CGRectGetMaxX(_avatar.frame)+10, 35, createAtSize.width, createAtSize.height);
    _createAt.frame=createAtRect;
    
    CGSize sourceSize=[_source.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    CGRect sourceRect=CGRectMake(CGRectGetMaxX(_createAt.frame)+10, 35, sourceSize.width,sourceSize.height);
    _source.frame=sourceRect;
    
    //设置微博内容大小和位置
    CGFloat textX=10;
    CGFloat textY=CGRectGetMaxY(_avatar.frame)+10;
    CGFloat textWidth=self.frame.size.width-10*2;
    
    CGSize textSize=[_text.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil].size;
    CGRect textRect=CGRectMake(textX, textY, textSize.width, textSize.height+0.01);
    _text.frame=textRect;
}

@end
