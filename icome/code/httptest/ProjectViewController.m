//
//  ProjectViewController.m
//  icome
//  综合
//  Created by zhouwenbo on 15/10/29.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "ProjectViewController.h"
#import "AFNetworking.h"
#import "HttpHelper.h"
#import "Investor.h"

@interface ProjectViewController ()
@property (strong, nonatomic) IBOutlet UITextField *text1;

@property (strong, nonatomic) IBOutlet UILabel *text2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化MutableArray
    self.investorList = [[NSMutableArray alloc] init];
    [HttpHelper getInvestorListWithPage:1 size:10 onSuccess:^(id successValue) {
        
        NSDictionary *dic = successValue;
        NSString* time = [dic objectForKey:@"timestamp"];
        NSLog(@"success and time is %@",time);
        NSDictionary *data = [dic objectForKey:@"data"];
        NSArray *list = [data objectForKey:@"list"];
        for(NSDictionary *obj in list){
            [_investorList addObject:[[Investor alloc] initWithDictionary:obj]];
        }
        NSLog(@"size is %li",[_investorList count]);
        
    } onFailure:^(id failureValue){
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

- (IBAction)onBtnClick:(id)sender {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSString *str = @"http://v3.ichuangdian.com/?c=investment&m=investor_mix_list&page=1&size=10";
    [session GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dic = responseObject;
        // NSInteger timestamp = [dic objectForKey:@"timestamp"];
        NSString *str = [dic objectForKey:@"error_msg"];
        
        NSLog(@"success and time is %@",str);
        [_text1 setText:str];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"failure");
        
    }];

}

- (IBAction)showAllInvestors:(UIButton *)sender {
    NSLog(@"list size is %li", _investorList.count);
    for (Investor *investor in _investorList){
        NSLog(@"name is %@", investor.name);
    }
}
@end
