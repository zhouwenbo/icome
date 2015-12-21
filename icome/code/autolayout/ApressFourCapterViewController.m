//
//  ApressFourCapterViewController.m
//  icome
//
//  Created by zhouwenbo on 15/11/24.
//  Copyright © 2015年 zhouwenbo. All rights reserved.
//

#import "ApressFourCapterViewController.h"

@interface ApressFourCapterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwdTextField;
@property (strong, nonatomic) IBOutlet UILabel *percentLabel;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;

@property (strong, nonatomic) IBOutlet UIButton *doSomethingButton;
@end

@implementation ApressFourCapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//action = Did End Exit resign的意思是"辞职，放弃，屈从",
//点击done会触发Did End Exit, 此时UITextField放弃第一响应权，键盘自然会消失
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}


//点击TextField，键盘消失
- (IBAction)backgroundTap:(id)sender {
    [_accountTextField resignFirstResponder];
    [_pwdTextField resignFirstResponder];
}

- (IBAction)silderValueChanged:(UISlider *)sender {
     float value = sender.value;
    int progress = (int)lrintf(value);
    NSString *values = [NSString stringWithFormat:@"%d", progress];
    [_percentLabel setText:values];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.on;
    [_leftSwitch setOn:setting animated:true];
    [_rightSwitch setOn:setting animated:true];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
    
}


@end
