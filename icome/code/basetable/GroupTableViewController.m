//
//  TableViewController.m
//  YesIKnowIcome
//
//  Created by zhouwenbo on 15/10/8.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//  分组的TableView
//

#import "GroupTableViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"
#import "UIViewExt.h"

@interface GroupTableViewController()
{
    UITableView *_tableView;
    //实际上放的是group（分组）
    NSMutableArray *_contacts;
}

@end

@implementation GroupTableViewController


-(void) viewDidLoad{
    [self initData];
    NSLog(@"self.view.left= %f and self.view.width = %f ",self.view.left, self.view.width);
    CGRect rect = CGRectMake(self.view.left, self.view.top + 64, self.view.width, self.view.height-64);
    _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    printf("viewDidLoad");
    
}

-(void) initData{
    //有时候会忘了这句话，如果不初始化，不会崩溃，但是显示不出来列表
    _contacts = [[NSMutableArray alloc] init];
    
    KCContact *contact1 = [[KCContact alloc] initWithFirstName:@"bob" andLastName:@"zhou" andPhoneNum:@"18410006152"];
    KCContact *contact2 = [[KCContact alloc] initWithFirstName:@"gou" andLastName:@"zhao" andPhoneNum:@"13218668756"];
    KCContact *contact3 = [[KCContact alloc] initWithFirstName:@"ji" andLastName:@"zhao" andPhoneNum:@"13726368763"];
    
    KCContactGroup *group1 = [[KCContactGroup alloc] initWithName:@"song dynasity" andDetail:@"so so so" andContacts:[NSMutableArray arrayWithObjects:contact1, contact2, contact3, nil]];
    
    KCContact *contact4 = [[KCContact alloc] initWithFirstName:@"fei" andLastName:@"yue" andPhoneNum:@"13678961234"];
    KCContact *contact5 = [[KCContact alloc] initWithFirstName:@"yun" andLastName:@"yue" andPhoneNum:@"1546945445" ];
    KCContact *contact6 =[[KCContact alloc] initWithFirstName:@"xiaoe" andLastName:@"li" andPhoneNum:@"13763669434"];
    KCContact *contact7 = [[KCContact alloc] initWithFirstName:@"ze" andLastName:@"zong" andPhoneNum:@"135173762553"];
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:contact4,contact5,contact6, contact7, nil];
    
    KCContactGroup *group2 = [[KCContactGroup alloc] initWithName:@"gernal" andDetail:@"they are so good" andContacts:array1];
    
    
    
    KCContact *contact8 = [[KCContact alloc] initWithFirstName:@"jack" andLastName:@"smith" andPhoneNum:@"13678961234"];
    KCContact *contact9 = [[KCContact alloc] initWithFirstName:@"lucy" andLastName:@"yue" andPhoneNum:@"1546945445" ];
    KCContact *contact10 =[[KCContact alloc] initWithFirstName:@"lily" andLastName:@"li" andPhoneNum:@"13763669434"];
    KCContact *contact11 = [[KCContact alloc] initWithFirstName:@"david" andLastName:@"zong" andPhoneNum:@"135173762553"];
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:contact8,contact9,contact10, contact11, nil];
    
    KCContactGroup *group3 = [[KCContactGroup alloc] initWithName:@"foreigner" andDetail:@"they are foreigners" andContacts:array2];
    
    [_contacts addObject:group1];
    [_contacts addObject:group2];
    [_contacts addObject:group3];
    printf("the count is %li", [_contacts count]);
    
}

//返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_contacts count];
}

//返回每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    KCContactGroup *group = _contacts[section];
    return group.contacts.count;
}

//cell设定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"生成单元格(组：%li, 行%li)",indexPath.section,indexPath.row);
    KCContactGroup *group=_contacts[indexPath.section];
    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNum;
    return cell;
}

//返回每组头标题名称
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    KCContactGroup *group = _contacts[section];
    return group.name;
}

//返回分组尾部说明(也就是详情)
-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    KCContactGroup *group = _contacts[section];
    return group.detail;
}

//每组头标题的高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 40;
}

//每组尾部说明的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

//每一个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    KCContactGroup *group = _contacts[indexPath.section];
    KCContact *contact = group.contacts[indexPath.row];
    
    printf("section is %li", indexPath.section);
    printf("row is %li", indexPath.row);
    NSLog(@"group name is %@", group.name);
    NSLog(@"contact name is %@", contact.getName);
    
    
    [self showAlertWithGroup:group andIndexPath:indexPath];
}

-(void) showAlertWithGroup:(KCContactGroup *) group andIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"title" message:@"这个是UIAlertController的默认样式" preferredStyle:UIAlertControllerStyleAlert];
    [alterController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = group.name;
    }];
    
    
    [alterController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = group.detail;

    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *name = alterController.textFields.firstObject.text;
            NSString *detail = alterController.textFields.lastObject.text;
            NSLog(@"name is %@", name);
            NSLog(@"detail is %@", detail);
            group.name = name;
            group.detail = detail;
        
        
        KCContact *contact = [[KCContact alloc] initWithFirstName:@"qing" andLastName:@"sima" andPhoneNum:@"13734567890"];
        [group.contacts addObject:contact];
        
        
        _contacts[indexPath.section] = group;
        
        
        [_tableView reloadData];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    
    [alterController addAction:okAction];
    [alterController addAction:cancelAction];
    
    [self presentViewController:alterController animated:YES completion:^{
        
    }];
}



@end
