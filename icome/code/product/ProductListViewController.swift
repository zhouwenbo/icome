//
//  ProductListViewController.swift
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/15.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

import Foundation
import UIKit


class ProductListViewController : UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let identifier:String = "cell_identifier"
    
    var tableView:UITableView!
    
    var products:[Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        let rect:CGRect = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y+64, width: self.view.bounds.size.width, height: self.view.bounds.size.height-64)
        tableView = UITableView.init(frame: rect, style: .Plain)
        //行定高则用这种写法
        tableView.rowHeight = 140
        
        //self.tableView.estimatedRowHeight = 160;
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    
    func initData() {
        
//        -(void) initData{
//            NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"plist"];
//            NSArray *array = [NSArray arrayWithContentsOfFile:path];
//            _models = [[NSMutableArray alloc] init];
//            _cells = [[NSMutableArray alloc] init];
//            for (int i = 0; i< [array count]; i++) {
//                NSDictionary *dic = [array objectAtIndex:i];
//                [_models addObject:[WeiboModel initWithDictionary:dic]];
//                
//                WeiboTableViewCell *cell = [[WeiboTableViewCell alloc] init];
//                [_cells addObject:cell];
//            }
//        }
        
        let path:String = NSBundle.mainBundle().pathForResource("product", ofType: "plist")!
        let array:NSArray = NSArray.init(contentsOfFile: path)!
        products = [Product]()
        for dic in array{
            //let j:Int = i as! Int
           // let dic:NSDictionary = array.objectAtIndex(j) as! NSDictionary
            products.append(Product.init(dic: dic as! NSDictionary))
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:ProductTableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? ProductTableViewCell
        if cell == nil {
           cell = ProductTableViewCell.init(style: .Default, reuseIdentifier: identifier)
        }
        cell?.setDataToView(products[indexPath.row])
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //行高如果变动则用这种方法
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 160
//    }
    
    
    
}