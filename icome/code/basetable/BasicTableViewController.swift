//
//  BasicTableViewController.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/10.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation
import UIKit


class BasicTableViewController : BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let identifier:String  = "language_cell"
    
    let identifierForSwitch:String = "switch_cell"
    
    var tableView:UITableView?
    
    var languages:[String] = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        //因为这个带导航栏，所以需要有64的Y轴偏移
        let rect : CGRect = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y, width: self.view.bounds.size.width, height: self.view.bounds.size.height-64)
        tableView = UITableView.init(frame: rect, style: UITableViewStyle.Plain)
        tableView!.delegate = self
        tableView!.dataSource = self

        //创建重用的cell,如果是一个
        //tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView!)
    }
    
    
    func initData() {
        languages.append("swift")
        languages.append("objective-c")
        languages.append("C")
        languages.append("java")
        languages.append("C++")
        languages.append("C#")
        languages.append("ruby")
        languages.append("javascript")
        languages.append("python")
        languages.append("php")
        languages.append("groovy")
        languages.append(".Net")
        languages.append("basic")
        languages.append("erlang")
        languages.append("shell")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (languages.count)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        let row : Int = indexPath.row
        if(row % 5 ==  0) {
            cell = tableView.dequeueReusableCellWithIdentifier(identifierForSwitch)
        } else{
            cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        }

        if (cell == nil) {
            if (row % 5 == 0) {
                //style:UITableViewCellStyle.Value1,两个UITable
                cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier:identifierForSwitch)
                let sw:UISwitch = UISwitch.init()
                sw.tag = row
                sw.addTarget(self, action: Selector("swValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
                cell?.accessoryView = sw
            } else {
                cell = UITableViewCell.init(style:UITableViewCellStyle.Value1, reuseIdentifier:identifier)
                cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
        }

        cell!.textLabel?.text = languages[indexPath.row]
        cell!.detailTextLabel?.text = languages[indexPath.row]
        return cell!
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //设置点击效果，一行代码搞定
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        NSLog("current index is %i and the language is %@", indexPath.row, (languages[indexPath.row]) )
    }
    
    func swValueChanged(sw:UISwitch) {
        print("sw value is \(sw.on) and the row is \(sw.tag)")
    }
    
}