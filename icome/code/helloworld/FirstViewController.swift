//
//  ViewController.swift
//  YesIKnowIcome
//  第一个基本入门的界面 hello world
//  Created by zhouwenbo on 15/9/25.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addLabel()
        addButton()
        addTextField()
        addTextView()
        addSwitch()
        addSegmented()
        addImageView()
        addProgressView()
        addSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //添加UILable
    func addLabel() {
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 50))
        label.text = "我知道，我来了， IOS!"
        //label.textColor = UIColor.whiteColor()
        //label.backgroundColor = UIColor.blackColor()
        label.textAlignment = NSTextAlignment.Right
        label.shadowColor = UIColor.grayColor()
        label.shadowOffset = CGSizeMake(-5, -5)
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
    }
    
    //添加button,按钮的文字，颜色和状态
    func addButton(){
//        let button1 : UIButton = UIButton.init(type: UIButtonType.RoundedRect)
//        button1.frame = CGRect(x: 0, y: 110, width: 100, height: 50)
//        button1.setTitle("to second", forState: UIControlState.Normal)
//        button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        button1.backgroundColor = UIColor.grayColor()
//        button1.addTarget(self, action: Selector("goToSecondPage"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button1)
//        
//        //goToTableView
//        let button3 : UIButton = UIButton.init(type: UIButtonType.RoundedRect)
//        button3.frame = CGRect(x: 105, y: 110, width: 90, height: 40)
//        button3.setTitle("分组列表", forState: UIControlState.Normal)
//        button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        button3.backgroundColor = UIColor.grayColor()
//        button3.addTarget(self, action: Selector("goToUITableView"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button3)
//        
//        
//        //goToTableView
//        let button4 : UIButton = UIButton.init(type: UIButtonType.RoundedRect)
//        button4.frame = CGRect(x: 225, y: 110, width: 120, height: 40)
//        button4.setTitle("基本列表", forState: UIControlState.Normal)
//        button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        button4.backgroundColor = UIColor.grayColor()
//        button4.addTarget(self, action: Selector("goToBasicUITableView"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(button4)
        
        
        //
        let button2 : UIButton = UIButton(frame: CGRect(x:0, y:150, width:200, height: 40));
        button2.setTitle("普通状态", forState: UIControlState.Normal)
        button2.setTitle("触摸状态", forState: UIControlState.Highlighted)
        button2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Highlighted)
        button2.backgroundColor = UIColor.redColor()
        button2.setImage(UIImage(named: "my_heart"), forState: UIControlState.Normal)
        button2.addTarget(self, action: Selector("tapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        //button2.setTitle("触摸状态", forState: <#T##UIControlState#>.Selected)
        self.view.addSubview(button2)
    }
    
    
    //用storyboard跳转
    func goToSecondPage() {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("hello_world2") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToUITableView() {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("firstTableViewController") as! GroupTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToBasicUITableView() {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("basicTableViewController") as! BasicTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //func tapped(button : UIButton) {
    //不能带参数, 如果带参数的，需要在selector 加:
    //func tapped() {
    //NSLog(button.titleForState(.Normal)!)
    //  NSLog("gogogo")
    //}
    
    //button 点击事件,用代码方式跳转
    func tapped(button : UIButton) {
//        NSLog(button.titleForState(.Normal)!)
//        
//        let secondViewController = SecondViewController.init()
//        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    //添加输入框
    func addTextField() {
        let textField1 = UITextField.init(frame: CGRectMake(100, 200, 200, 40))
        textField1.borderStyle = UITextBorderStyle.RoundedRect
        textField1.textAlignment = NSTextAlignment.Center
        textField1.text = "zhouwenbo"
        //一进入页面就获得焦点，弹出软键盘
        //textField1.becomeFirstResponder()
        textField1.returnKeyType = .Next
        textField1.contentVerticalAlignment = .Center
        textField1.delegate = self
        textField1.clearButtonMode = .WhileEditing
        textField1.placeholder = "请输入用户名"
        
        let textField2 = UITextField(frame: CGRect(x: 100, y: 250, width: 200, height: 40))
        textField2.borderStyle = UITextBorderStyle.RoundedRect
        textField2.textAlignment = NSTextAlignment.Left
        textField2.returnKeyType = .Send
        textField2.delegate = self
        textField2.clearButtonMode = .WhileEditing
        textField2.placeholder = "请输入密码"
        
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
    }
    
    //键盘代理，当点击键盘的enter时的操作
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("textField content is", textField.text)
        return true
    }
    
    //多行文本控件
    func addTextView() {
        let textView = UITextView.init(frame: CGRect(x:0, y:300, width: 200, height: 100));
        //let textView = UITextView.init()
        //textView.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
        textView.text = "我种下一颗种子\n终于长出了果实\n今天是个伟大日子\n摘下星星送给你\n拽下月亮送给你\n让太阳每天为你起"
        textView.textColor = UIColor.blackColor()
        textView.editable = false
        self.view.addSubview(textView)
    }
    
    //添加开关按钮
    func addSwitch() {
        let sh = UISwitch.init()
        sh.center = CGPointMake(60, 250)
        sh.addTarget(self, action: Selector("switchChanged:"), forControlEvents:UIControlEvents.ValueChanged)
        self.view.addSubview(sh)
    }
    
    //开关按钮的变化事件
    func switchChanged(sh : UISwitch) {
        print(sh.on)
    }
    
    //添加选项卡
    func addSegmented() {
        //还是文字比较好看
        let items = ["最新","最热","排行榜"]
        //let items2 : Array<UIImage> = [UIImage(named: "my_heart")!,UIImage(named: "my_share")!,UIImage(named: "my_setting")!]
        //items.append(UIImage(named: "my_"))
        let segment = UISegmentedControl(items: items)
        segment.center = self.view.center// CGPointMake(90, 420)
        segment.tintColor = UIColor.redColor()
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: Selector("segValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segment)
    }
    
    //UISegmentedControl 值发生变化时的回调
    func segValueChanged(seg : UISegmentedControl) {
        let index = seg.selectedSegmentIndex
        print("index = \(index)")
        print("index value = " + seg.titleForSegmentAtIndex(index)!)
    }
    
    //添加imageView
    func addImageView() {
        let imageView = UIImageView(image: UIImage(named: "my_share"))
        imageView.frame = CGRect(x: 10, y: 420, width: 100, height: 100)
        self.view.addSubview(imageView)
        
        //imageView添加动画
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(x: 110, y: 420, width: 100, height: 100)
        imageView2.animationImages = [UIImage(named: "my_share")!, UIImage(named: "my_heart")!]
        imageView2.animationDuration = 0.5
        imageView2.animationRepeatCount = 4
        imageView2.startAnimating()
        self.view.addSubview(imageView2)
    }
    
    //添加进度条
    func addProgressView() {
        let progressView = UIProgressView(progressViewStyle: .Default)
        progressView.frame = CGRect(x: 10, y:520, width: 200, height:40)
        progressView.setProgress(0.8, animated: true)
        self.view.addSubview(progressView)
    }
    
    //添加滑块
    func addSlider() {
        let slider = UISlider(frame: CGRect(x: 10, y: 540, width: 200, height: 40))
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
        slider.addTarget(self, action: Selector("sliderValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
    }
    
    //slider值发生变化时
    func sliderValueChanged(slider : UISlider) {
        print(slider.value)
    }
    
}

