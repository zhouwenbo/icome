//
//  SecondPage.swift
//  YesIKnowIcome
//  第二个入门的基本界面 hello world
//  Created by zhouwenbo on 15/9/29.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController : UIViewController {
    
    @IBOutlet var uiStepper: UIStepper!
    
    @IBOutlet var stepText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "second"
        uiStepperAction()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToAlert(sender: UIButton) {
        let alertView = UIAlertController(title: "title", message: "this is content", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default){ (UIAlertAction) -> Void in
             print("ok")
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            print("cancel")
        }
        
        alertView.addAction(okAction)
        alertView.addAction(cancelAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    @IBAction func goToAlert2(sender: UIButton) {
        let alertView = UIAlertController(title: "title", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertView.addTextFieldWithConfigurationHandler { (text: UITextField) -> Void in
            text.placeholder = "账号"
        }
        
        alertView.addTextFieldWithConfigurationHandler { (text: UITextField) -> Void in
            text.placeholder = "密码"
            text.secureTextEntry = true
        }

        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default){ (UIAlertAction) -> Void in
                print("ok")
            let account = alertView.textFields?.first
            let pwd = alertView.textFields?.last
            print(account?.text)
            print(pwd?.text)
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            print("cancel")
        }
        
        alertView.addAction(okAction)
        alertView.addAction(cancelAction)
        
        
        self.presentViewController(
            alertView, animated: true) { () -> Void in
                
        }
    }
    
    
    @IBAction func gotoAlert3(sender: AnyObject) {
        let alertViewController = UIAlertController(title: "请选择", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let okAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.Default){
            (UIAlertAction) -> Void in
            print("保存")
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (UIAlertAction) ->
            Void in
            print("取消")
        }
        
        let deleteAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.Destructive) { (UIAlertAction) -> Void in
            print("删除")
        }
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(deleteAction)
        alertViewController.addAction(cancelAction)
        
        self.presentViewController(alertViewController, animated: true) { () -> Void in
            
        }
    }
    
    func uiStepperAction() {
        uiStepper.maximumValue = 10
        uiStepper.minimumValue = 1
        uiStepper.stepValue = 1
        uiStepper.value = 1
        
        uiStepper.addTarget(self, action: Selector("stepperValuedChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func stepperValuedChanged(stepper : UIStepper) {
        print("value is " + String(stepper.value))
        stepText.text = String(stepper.value)
    }
    
    
    
    
}
