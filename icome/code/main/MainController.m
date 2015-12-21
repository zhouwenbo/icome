//
//  MainController.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/12.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//  入口controller
//

#import "MainController.h"
#import "icome-Swift.h"
#define identifier @"zhouwenbo"

@interface MainController(){


    UITableView *_tableView;
    NSMutableArray *_models;
    NSString *str;

}
@end

@implementation MainController


-(void) viewDidLoad{
    [super viewDidLoad];
    self.title = @"icome";
    [self setBackButton];
    
    [self initData];
    CGRect rect = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    [_tableView registerClass:UITableViewCell.self forCellReuseIdentifier:identifier];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];

    
    
}


-(void) initData{
    _models = [[NSMutableArray alloc] init];
    
   //UIModel *model = [[UIModel alloc] init];
    [_models addObject:[[UIModel alloc] initWithTitle:@"to hello world 1" sbId:@"FirstViewController" ]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"to hello word 2" sbId:@"SecondViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"基本列表" sbId:@"BasicTableViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"分组列表" sbId:@"GroupTableViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"微博列表" sbId:@"WeiboTableViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"项目列表" sbId:@"ProductListViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"oc 项目列表" sbId:@"ProductTableViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"swift vc之间数据传递" sbId:@"DataTransportVC1"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"oc vc之间数据传递" sbId:@"OcDtVC1"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"http 请求" sbId:@"ProjectViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"auto layout1" sbId:@"AutoLayoutViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"auto layout2" sbId:@"ApressFourCapterViewController"]];
    [_models addObject:[[UIModel alloc] initWithTitle:@"auto layout3" sbId:@"ApressFiveCapterViewController"]];
    // UIModel *mo = [UIModel alloc] initWithTitle:@"分组列表" sbId:@""];
//    [_models addObject:@"to my first"];
//    [_models addObject:@"to my second"];
//    [_models addObject:@"基本列表"];
//    [_models addObject:@"分组列表"];
}

//只有一组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//cell数量等于titles count
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_models count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    UIModel *model = [_models objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:( NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:true];
    UIModel *model = [_models objectAtIndex:indexPath.row];
    UIViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:model.sbId];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) didReceiveMemoryWarning{
    
}



-(void) setBackButton{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    [backItem setTintColor:[UIColor whiteColor]];
    [backItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    UIImage *backImg = [UIImage imageNamed:@"NavItem_back"];
    [backItem setBackButtonBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    self.navigationItem.backBarButtonItem = backItem;
}

@end



