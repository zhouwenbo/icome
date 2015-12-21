//
//  ProducViewCell.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/27.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "ProductViewCell.h"
#import "icome-Swift.h"
#import "UIViewExt.h"

#define LINE_HEIGHT_12  [UIFont systemFontOfSize:12].lineHeight
#define LINE_HEIGHT_14  [UIFont systemFontOfSize:14].lineHeight
#define LINE_HEIGHT_18  [UIFont systemFontOfSize:18].lineHeight

@interface ProductViewCell(){
    //model

    //logo
    UIImageView *logoImg;
    //标题
    UILabel *titleLabel;
    //描述
    UILabel *descLabel;
    //地区
    UILabel *areaLabel;
    //行业
    UILabel * stageLabel;
    //投资机构
    UILabel *investorLabel;
    //长横向分割线
    UIView *longHLine;
    //轮次
    UILabel *roundLabel;
    //需要资金
    UILabel *moneyLable;
    //约谈数的图标
    UIImageView *chatImg;
    //约谈数
    UILabel *chatCountLabel;
    //约谈数和粉丝数之间的竖线
    UIView *shortVLine;
    //粉丝数的图标
    UIImageView *fansImg;
    //粉丝数目
    UILabel *fansCountLabel;
    
}
@end

@implementation ProductViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    
    return self;
}


-(void) initView{
    logoImg = [[UIImageView alloc] init];
    logoImg.frame = CGRectMake(10, 10, 80, 80);
    [self addSubview:logoImg];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.numberOfLines = 1;
    
    titleLabel.frame = CGRectMake(logoImg.right+10, 15, SCREEN_W-logoImg.right-10, LINE_HEIGHT_18);
    [self addSubview:titleLabel];
    
    descLabel = [[UILabel alloc] init];
    descLabel.textColor = [UIColor grayColor];
    descLabel.font = [UIFont systemFontOfSize:14];
    descLabel.numberOfLines = 2;
    descLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    CGRect descRect = CGRectMake(titleLabel.left, titleLabel.bottom+5, titleLabel.width, LINE_HEIGHT_14*2);
    descLabel.frame = descRect;
    [self addSubview:descLabel];
    
    areaLabel = [[UILabel alloc] init];
    areaLabel.textColor = [UIColor grayColor];
    areaLabel.font = [UIFont systemFontOfSize:12];
    areaLabel.frame = CGRectMake(titleLabel.left, descLabel.bottom+5, 60, LINE_HEIGHT_12);
    [self addSubview:areaLabel];
    
    
    stageLabel = [[UILabel alloc] init];
    stageLabel.textColor = [UIColor grayColor];
    stageLabel.font = [UIFont systemFontOfSize:12];
    stageLabel.frame = CGRectMake(areaLabel.right+ 10, areaLabel.top, 50, LINE_HEIGHT_12);
    [self addSubview:stageLabel];
    
    
    investorLabel = [[UILabel alloc] init];
    investorLabel.textColor = [UIColor grayColor];
    investorLabel.font = [UIFont systemFontOfSize:12];
    investorLabel.frame = CGRectMake(SCREEN_W-120, areaLabel.top, 100, LINE_HEIGHT_12);
    [self addSubview:investorLabel];
    
    longHLine = [[UIView alloc] init];
    longHLine.backgroundColor = [UIColor grayColor];
    longHLine.frame = CGRectMake(5, logoImg.bottom + 12, SCREEN_W - 10, 0.5);
    [self addSubview:longHLine];
    
    roundLabel = [[UILabel alloc] init];
    roundLabel.textColor = [UIColor blackColor];
    roundLabel.font = [UIFont systemFontOfSize:14];
    roundLabel.frame = CGRectMake(logoImg.left + 5, longHLine.bottom+5, 35, LINE_HEIGHT_14);
    [self addSubview:roundLabel];
    
    moneyLable = [[UILabel alloc] init];
    moneyLable.textColor = [UIColor blackColor];
    moneyLable.font = [UIFont systemFontOfSize:14];
    moneyLable.frame = CGRectMake(50, roundLabel.top, 120, LINE_HEIGHT_14);
    [self addSubview:moneyLable];
    
    chatImg = [[UIImageView alloc] init];
    chatImg.frame = CGRectMake(SCREEN_W - 120, roundLabel.top, LINE_HEIGHT_14, LINE_HEIGHT_14);
    chatImg.image = [UIImage imageNamed:@"chat"];
    [self addSubview:chatImg];
    
    chatCountLabel = [[UILabel alloc] init];
    chatCountLabel.textColor = [UIColor blackColor];
    chatCountLabel.font = [UIFont systemFontOfSize:14];
    chatCountLabel.frame = CGRectMake(chatImg.right + 5, roundLabel.top, 30,  LINE_HEIGHT_14);
    [self addSubview:chatCountLabel];
    
    shortVLine = [[UIView alloc] init];
    shortVLine.backgroundColor = [UIColor grayColor];
    shortVLine.frame = CGRectMake(chatCountLabel.right + 5, roundLabel.top, 1, 18);
    [self addSubview:shortVLine];
    
    fansImg = [[UIImageView alloc] init];
    fansImg.frame = CGRectMake(shortVLine.right + 5, roundLabel.top, LINE_HEIGHT_14, LINE_HEIGHT_14);
    fansImg.image = [UIImage imageNamed:@"fans"];
    [self addSubview:fansImg];
    
    fansCountLabel = [[UILabel alloc] init];
    fansCountLabel.textColor = [UIColor blackColor];
    fansCountLabel.font = [UIFont systemFontOfSize:14];
    fansCountLabel.frame = CGRectMake(fansImg.right + 5, roundLabel.top, 40, LINE_HEIGHT_14);
    [self addSubview:fansCountLabel];
}

-(void) setProduct:(Product *)product{
    NSLog(@"product title is %@", product.name);
    logoImg.image = [UIImage imageNamed:product.logoImg];
    titleLabel.text = product.name;
    descLabel.text = product.desc;
    areaLabel.text = product.area;
    stageLabel.text = product.stage;
    investorLabel.text = [self getInvestor:product.reca];
    roundLabel.text = product.whichLun;
    moneyLable.text = [self getMoney:product.demondMoney];
    chatCountLabel.text = [ NSString stringWithFormat: @"%li" ,product.chatCount];
    fansCountLabel.text = [ NSString stringWithFormat: @"%li" ,product.fansCount];
    
}

-(NSString *)getInvestor:(NSString *) str {
    NSString *str1 = [NSString stringWithFormat:@"投资机构:%@", str];
    return str1;
}

-(NSString *)getMoney:(NSInteger) money {
    
    return [NSString stringWithFormat:@"需要资金%li万", money];
}


@end
