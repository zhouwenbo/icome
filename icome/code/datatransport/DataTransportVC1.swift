//
//  DataTansportVC1.swift
//  YesIKnowIcome
//  两个ViewController之间的数据传递
//  正向传输，如果是采用生成对象跳转(非storyboard)的话，直接设置成员变量即可
//  反向传输，采用delegate
//  Created by zhouwenbo on 15/10/19.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation
import UIKit
class DataTransportVC1:UIViewController, SendMessageDelegate{
    
    
    @IBOutlet var text1: UITextField!
    
    @IBOutlet var text2: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func toVC2(sender: AnyObject) {
        let str1:String = text1.text!
        let str2:String = text2.text!
        if (!str1.isEmpty && !str2.isEmpty) {
            NSLog("str1 is \(str1)")
            let vc2:DataTransportVC2 = DataTransportVC2.init()
            //正向传值直接赋值
            vc2.name = str1
            vc2.pwd = str2
            
            //反向传值代理
            vc2.sendMsgDelegate = self
            self.navigationController?.pushViewController(vc2, animated: true)
        } else{
            NSLog("text is nil")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    func sendWord(text: String) {
        text1.text = text
    }
    
}