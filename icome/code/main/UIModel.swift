//
//  UImo.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/12.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation

class UIModel: NSObject {
    var title:String = ""
    var sbId:String = ""
    
    
    init(title:String, sbId:String) {
        self.title = title
        self.sbId = sbId
    }
}
