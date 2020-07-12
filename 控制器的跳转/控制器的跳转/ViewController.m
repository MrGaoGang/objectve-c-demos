//
//  ViewController.m
//  控制器的跳转
//
//  Created by alexganggao on 2020/6/25.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
//4. A页面必须遵循第一步声明的协议
@interface ViewController ()<passValueProtocol>
- (IBAction)moveToSecond:(id)sender;
- (IBAction)segueMoveToSecond:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *secondPassValueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlerNoti:) name:@"abc" object:nil];
}


- (IBAction)moveToSecond:(id)sender {
    //    1. 初始化要跳转的控制器
    SecondViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
    //6. B页面的代理必须设置为A页面；
    //    vc.delegate=self;
    //    4. A页面实例化B Controller的时候实现Block
    vc.passValueBlock = ^(NSString * _Nonnull info) {
        self.secondPassValueLabel.text= info;
    };
    vc.passValue=@"我是第一个页面传递过来的数据";
    //    执行跳转逻辑，使用Modal的方式
    if (@available(iOS 13.0, *)) {
    vc.modalPresentationStyle =UIModalPresentationFullScreen;
    }

    [self presentViewController:vc animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController *second = segue.destinationViewController;
    second.passValue =@"我是通过Segue的方式传递的值";
}

- (IBAction)segueMoveToSecond:(id)sender {
    [self performSegueWithIdentifier:@"abcd" sender:nil];
}
// 5. A页面必须实现协议的方法

- (void)passValueToOne:(NSString *)value{
    self.secondPassValueLabel.text=value;
}
// 处理监听到来
- (void)handlerNoti:(NSNotification *)noti{
    NSDictionary *userInfo= noti.userInfo;
    self.secondPassValueLabel.text=userInfo[@"info"];
}

@end
