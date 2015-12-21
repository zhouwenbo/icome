//
//  WeiboTableViewController.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/13.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "WeiboTableViewController.h"
#import "WeiboModel.h"
#import "WeiboTableViewCell.h"
#define cellIdentifier @"cellIdentifier"


@interface WeiboTableViewController(){
    UITableView *_tableView;
    NSMutableArray *_models;
    NSMutableArray *_cells;
}
@end

@implementation WeiboTableViewController
-(void) viewDidLoad{
    [super viewDidLoad];
    [self initData];
    CGRect rect = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height-64);
    _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}


-(void) initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _models = [[NSMutableArray alloc] init];
    _cells = [[NSMutableArray alloc] init];
    for (int i = 0; i< [array count]; i++) {
        NSDictionary *dic = [array objectAtIndex:i];
        [_models addObject:[WeiboModel initWithDictionary:dic]];
        
        WeiboTableViewCell *cell = [[WeiboTableViewCell alloc] init];
        [_cells addObject:cell];
    }
}

//每组的条数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"count= %ld",[_models count]);
    
    return [_models count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[WeiboTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    WeiboModel *model = [_models objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    WeiboTableViewCell *cell = _cells[indexPath.row];
//    cell.model= _models[indexPath.row];
    return WeiboTableViewCell_H;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [_tableView deselectRowAtIndexPath:indexPath animated:true];
}

//#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
