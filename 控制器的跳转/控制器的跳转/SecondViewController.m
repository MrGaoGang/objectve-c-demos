//
//  SecondViewController.m
//  控制器的跳转
//
//  Created by alexganggao on 2020/6/25.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)passValueClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputValue;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.infoLabel.text=self.passValue;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)passValueClick:(id)sender {
    NSString *str = self.inputValue.text;
    //    3, 使用代理，将要传递的值给代理对象
    //    [self.delegate passValueToOne:str];
    //    3. 使用Bolck完成传值
    //    if(self.passValueBlock){
    //        self.passValueBlock(str);
    //    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"abc" object:nil userInfo:@{
        @"info" : str
    }];
    //    关闭当前页面
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
