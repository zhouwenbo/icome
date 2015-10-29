//
//  UIFontExt.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/16.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import UIKit

extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: CGFloat) -> CGSize {
        return NSString(string: string).boundingRectWithSize(CGSize(width: width, height: CGFloat(DBL_MAX)),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
}