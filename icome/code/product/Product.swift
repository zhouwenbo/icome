//
//  Product.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/15.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation

class Product:NSObject {

    //log图片
    var logoImg:String = ""
    //名字
    var name:String = ""
    //描述
    var desc:String = ""
    //地域
    var area:String = ""
    //阶段
    var stage:String = ""
    //推荐机构
    var reca:String = ""
    //哪一轮次(天使轮 A轮 B轮)
    var whichLun:String = ""
    //需要金额
    var demondMoney:Int = 0
    //粉丝数目(关注数目)
    var fansCount:Int = 0
    //约谈数目
    var chatCount:Int = 0
    
    init(dic:NSDictionary) {
        self.logoImg = dic.objectForKey("logoImg") as! String
        self.name = dic.objectForKey("name") as! String
        self.desc = dic.objectForKey("desc") as! String
        self.area = dic.objectForKey("area") as! String
        self.stage = dic.objectForKey("stage") as! String
        self.reca = dic.objectForKey("reca") as! String
        self.whichLun = dic.objectForKey("whichLun") as! String
        self.demondMoney = dic.objectForKey("demondMoney") as! Int
        self.fansCount = dic.objectForKey("fansCount") as! Int
        self.chatCount = dic.objectForKey("chatCount") as! Int
    }
    
}
