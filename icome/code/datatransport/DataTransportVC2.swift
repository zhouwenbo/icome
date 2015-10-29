//
//  DataTransportVC2.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/19.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation
import UIKit

protocol SendMessageDelegate{
    func sendWord(text:String)
}

class DataTransportVC2 : UIViewController {
    
    
    var name:String!
    var pwd:String!
    
    var textField1:UITextField!
    
    //protocol
    var sendMsgDelegate:SendMessageDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        textField1 = UITextField.init(frame: CGRectMake(80, 120, 200, 40))
        textField1.borderStyle = .RoundedRect
        //textFiled1.frame = CGRect(x: 60, y: 30, width: 80, height: 30)
        textField1.placeholder = "传给VC1的text"
        self.view.addSubview(textField1)
        
        let button:UIButton = UIButton.init(frame: CGRect(x: 150, y: 170, width: 50, height: 30))
        button.setTitle("to vc1", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        //button.setTitleColor(UIColor.greenColor(), forState: .Selected)
        button.setTitleColor(UIColor.greenColor(), forState: .Highlighted)
        button.addTarget(self, action: Selector("toVC1:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        addTextField()
    }
    
    
    func toVC1(sender:UIButton) {
        //不用判空，但是此时，delegate已经在vc1跳转时指定了
        self.sendMsgDelegate?.sendWord(textField1.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    //添加输入框
    func addTextField() {
        let textField1 = UITextField.init(frame: CGRectMake(80, 250, 200, 40))
        textField1.borderStyle = UITextBorderStyle.RoundedRect
        textField1.textAlignment = NSTextAlignment.Center
        textField1.text = name
        //一进入页面就获得焦点，弹出软键盘
        //textField1.becomeFirstResponder()
        textField1.returnKeyType = .Next
        textField1.contentVerticalAlignment = .Center
       // textField1.delegate = self
        textField1.clearButtonMode = .WhileEditing
        textField1.placeholder = "vc1传来的text1"
        
        let textField2 = UITextField(frame: CGRect(x: 80, y: 300, width: 200, height: 40))
        textField2.borderStyle = UITextBorderStyle.RoundedRect
        textField2.textAlignment = NSTextAlignment.Center
        textField2.returnKeyType = .Send
      //  textField2.delegate = self
        textField2.clearButtonMode = .WhileEditing
        textField2.text = pwd
        textField2.placeholder = "vc2传来的text2"
        
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
    }

}