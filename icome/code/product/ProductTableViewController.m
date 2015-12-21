//
//  ProductTableViewController.m
//  YesIKnowIcome
//  oc版本优化过的product list UITableView
//  Created by zhouwenbo on 15/10/27.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "ProductTableViewController.h"
#import "UIViewExt.h"
#import "icome-Swift.h"
#import "ProductViewCell.h"
#define CELL_IDENTIFIER @"cell_identifier"
@interface ProductTableViewController(){
    UITableView *_tableView;
    NSMutableArray *dataList;
}
@end

@implementation ProductTableViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    [self initData];
    //x 相当于left y相当于top
    CGRect rect = CGRectMake(self.view.left, self.view.top, self.view.width, self.view.height-64);
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}


-(void) initData{
    dataList = [[NSMutableArray alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"product" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    for(int i = 0; i<[array count]; i++) {
        [dataList addObject:[[Product alloc] initWithDic:array[i]]];
    }
    NSLog(@"initData success!!!");
}

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return [dataList count];
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    if (!cell) {
        cell = [[ProductViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    
    Product *p = dataList[indexPath.row];
    cell.product = p;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}


@end
