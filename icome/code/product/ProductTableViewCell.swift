//
//  ProductTableViewCell.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/15.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import UIKit

class ProductTableViewCell : UITableViewCell{
    
    //logo
    var logoUIImageView:UIImageView!
    //名字
    var nameUILabel:UILabel!
    //描述
    var descUILabel:UILabel!
    //区域
    var areaUILabel:UILabel!
    //阶段
    var stageUILabel:UILabel!
    //推荐机构
    var recaUILabel:UILabel!
    //轮次
    var whichLunUILabel:UILabel!
    //需求资金
    var demondMoneyUILabel:UILabel!
    //约谈数目
    var chatCountUILabel:UILabel!
    //约谈旁边的那个图标
    var chatCountUIImageView:UIImageView!
    //粉丝数目
    var fansCountUILabel:UILabel!
    //粉丝旁边的那个图标
    var fansCountUIImageView:UIImageView!
    //横向的分割线
    var lineView:UIView!
    //粉丝数目和约谈数目之间的纵向的分割线
    var stripLineView:UIView!
    
    var screenWidth:CGFloat!
  
    
    var product:Product!
    
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        screenWidth = UIScreen.mainScreen().bounds.size.width;
        initView()
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    
    func initView() {
        logoUIImageView = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
        self.addSubview(logoUIImageView)
        
       // let nameLableX:CGFloat =  CGRectGetMaxX((logoUIImageView?.frame)!) + 10
        
// nameUILabel = UILabel.init(frame: CGRect(x: nameLableX, y: 15, width: <#T##CGFloat#>, height: CGFloat));
        
        nameUILabel = UILabel.init()
        nameUILabel.textColor = UIColor.blackColor()
        nameUILabel.font = UIFont.systemFontOfSize(18)
        let width:CGFloat = screenWidth - logoUIImageView.frame.origin.x - 10
        nameUILabel.frame = CGRect(x: CGRectGetMaxX(logoUIImageView.frame)+10, y: 15, width: width, height: 30)
        self.addSubview(nameUILabel)
        
        descUILabel = UILabel.init()
        descUILabel.textColor = UIColor.grayColor()
        descUILabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(descUILabel)
        
        areaUILabel = UILabel.init()
        areaUILabel.textColor = UIColor.init(red: 120/250, green: 120/250, blue: 120/250, alpha: 1.0)
        areaUILabel.font = UIFont.systemFontOfSize(12)
        self.addSubview(areaUILabel)
        
        stageUILabel = UILabel.init()
        stageUILabel.textColor = UIColor.init(red: 120/250, green: 120/250, blue: 120/250, alpha: 1.0)
        stageUILabel.font = UIFont.systemFontOfSize(12)
        self.addSubview(stageUILabel)
        
        recaUILabel = UILabel.init()
        recaUILabel.textColor = UIColor.init(red: 120/250, green: 120/250, blue: 120/250, alpha: 1.0)
        recaUILabel.font = UIFont.systemFontOfSize(12)
        self.addSubview(recaUILabel)
        
        
        whichLunUILabel = UILabel.init()
        whichLunUILabel.textColor = UIColor.blackColor()
        whichLunUILabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(whichLunUILabel)
        
        demondMoneyUILabel = UILabel.init()
        demondMoneyUILabel.textColor = UIColor.blackColor()
        demondMoneyUILabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(demondMoneyUILabel)
        
        chatCountUILabel = UILabel.init()
        chatCountUILabel.textColor = UIColor.blackColor()
        chatCountUILabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(chatCountUILabel)
        
        chatCountUIImageView = UIImageView.init(image:UIImage(named: "chat"))
        self.addSubview(chatCountUIImageView)
        
        fansCountUILabel = UILabel.init()
        fansCountUILabel.textColor = UIColor.blackColor()
        fansCountUILabel.font = UIFont.systemFontOfSize(14)
        self.addSubview(fansCountUILabel)
        
        
        fansCountUIImageView = UIImageView.init(image:UIImage(named: "fans"))
        self.addSubview(fansCountUIImageView)
        
        lineView = UIView.init()
        lineView.backgroundColor = UIColor.grayColor()
        self.addSubview(lineView)
        
        stripLineView = UIView.init()
        stripLineView.backgroundColor = UIColor.grayColor()
        self.addSubview(stripLineView)
    }
    
    func setDataToView(product: Product) {
        logoUIImageView.image = UIImage(named: product.logoImg)
        
        
        let nameLableX:CGFloat = CGRectGetMaxX((logoUIImageView.frame)) + 10
        let nameSize:CGSize = (product.name as NSString).sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(18)])
        nameUILabel.text = product.name
        nameUILabel.frame = CGRect(x: nameLableX, y: 15, width: nameSize.width, height: nameSize.height)
        
        let descLableX:CGFloat = nameLableX
        let descLableY:CGFloat = CGRectGetMaxY(nameUILabel.frame) + 5
        let descTextWidth:CGFloat = self.frame.size.width - logoUIImageView.frame.size.width - 20
        let descSize = sizeOfString(product.desc, constrainedToWidth:descTextWidth)
        descUILabel.text = product.desc
        descUILabel.frame = CGRect(x: descLableX, y: descLableY, width: descSize.width, height: descSize.height)
        descUILabel.numberOfLines = 2
        descUILabel.lineBreakMode = .ByTruncatingTail
        
        
        
        let areaLableX:CGFloat = nameLableX
        let areaLableY:CGFloat = CGRectGetMaxY(logoUIImageView.frame)-10
        let areaSize = (product.area as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        areaUILabel.text = product.area
        areaUILabel.frame = CGRect(x: areaLableX, y: areaLableY, width: areaSize.width, height: areaSize.height)
        
        let stageLabelX:CGFloat = CGRectGetMaxX(areaUILabel.frame) + 20
        let stageLabelY:CGFloat = areaLableY
        let stageSize = (product.stage as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        stageUILabel.text = product.stage
        stageUILabel.frame = CGRect(x: stageLabelX, y: stageLabelY, width: stageSize.width, height: stageSize.height)
        
        //let recaX:CGFloat = CGRectGetMaxX(stageUILabel.frame) + 20
        let recaY:CGFloat = areaLableY
        let recaStr:NSString = ("推荐机构:" + product.reca) as NSString
        let recaSize:CGSize = recaStr.sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        recaUILabel.text = recaStr as String

        recaUILabel.frame = CGRect(x: UIScreen.mainScreen().bounds.size.width*2/3, y: recaY, width: recaSize.width, height: recaSize.height)
        
        let lineViewY:CGFloat = CGRectGetMaxY(logoUIImageView.frame) + 10
        lineView.frame = CGRect(x: 10, y: lineViewY, width: self.frame.width, height: 0.5)
        
        let whichLunX:CGFloat = 15.0
        let whichLunY:CGFloat = CGRectGetMaxY(lineView.frame) + 10
        let whichLunSize = (product.whichLun as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)])
        whichLunUILabel.text = product.whichLun
        whichLunUILabel.frame = CGRect(x: whichLunX, y: whichLunY, width: whichLunSize.width, height: whichLunSize.height)
        
        let moneyX:CGFloat = CGRectGetMaxX(whichLunUILabel.frame) + 15
        let moneyY:CGFloat = whichLunY
        let moneyStr:String = getMoneyText(product.demondMoney)
        let moneySize:CGSize = (moneyStr as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)])
        demondMoneyUILabel.text = moneyStr
        demondMoneyUILabel.frame = CGRect(x: moneyX, y: moneyY, width: moneySize.width, height: moneySize.height)
        
        let chatImgX:CGFloat = UIScreen.mainScreen().bounds.size.width*2/3;
        let chatImgY:CGFloat = whichLunY
        chatCountUIImageView.frame = CGRect(x: chatImgX, y: chatImgY, width: 14, height: 14)
        
        let chatCountX:CGFloat = CGRectGetMaxX(chatCountUIImageView.frame) + 5
        let chatCountY:CGFloat = whichLunY
        let chatCountStr = String(product.chatCount)
        let chatCountSize:CGSize = (chatCountStr as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        chatCountUILabel.text = chatCountStr
        NSLog("chatCountSize width is \(chatCountSize.width) and height is \(chatCountSize.height)")
        chatCountUILabel.frame = CGRect(x: chatCountX, y: chatCountY, width: 30, height: chatCountSize.height)
        
        
        let stripLineX:CGFloat = CGRectGetMaxX(chatCountUILabel.frame)
        let stripLineY:CGFloat = whichLunY
        stripLineView.frame = CGRect(x: stripLineX, y: stripLineY, width: 1, height: 15)
        
        let fansImgX:CGFloat = CGRectGetMaxX(stripLineView.frame) + 10
        let fansImgY:CGFloat = whichLunY
        fansCountUIImageView.frame = CGRect(x: fansImgX, y: fansImgY, width: 14, height: 14)
        
        let fansX:CGFloat = CGRectGetMaxX(fansCountUIImageView.frame) + 2
        let fansY:CGFloat = whichLunY
        let fansCountStr = String(product.fansCount)
        //let fansCountSize:CGSize = (fansCountStr as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        fansCountUILabel.text = fansCountStr
        fansCountUILabel.frame = CGRect(x: fansX, y: fansY, width: 40, height: 14)
        
        
    }
    
    func getMoneyText(count:Int) -> String {
        let str: NSString = NSString.init(format: "需要资金%i万", count)
        return str as String
    }
    
    
    func sizeOfString (string: String, constrainedToWidth width: CGFloat) -> CGSize {
        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: 38),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)],
            context: nil).size
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        
    }
    
    
}