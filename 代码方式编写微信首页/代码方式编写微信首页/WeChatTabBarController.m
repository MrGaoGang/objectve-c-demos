//
//  WeChatTabBarController.m
//  代码方式编写微信首页
//
//  Created by alexganggao on 2020/6/26.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "WeChatTabBarController.h"
#import "WechatViewController.h"
#import "ConnactViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"
@interface WeChatTabBarController ()

- (UIViewController *) createCustomViewController:(NSString *) controller  setTitle :  (NSString *) title setDefault : (NSString *) defaultImage setActive : (NSString *) activeImage;


- (UINavigationController *)createNavigationController:(UIViewController *) controller ;
@end

@implementation WeChatTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    1. 创建控制器，包括微信，联系人，发现；为了查看效果，此处就不再次封装了
    WechatViewController *wechat =[self createCustomViewController:@"WechatViewController" setTitle:@"微信" setDefault:@"tabbar_mainframe" setActive:@"tabbar_mainframeHL"];
    
    ConnactViewController *connects =[self createCustomViewController:@"ConnactViewController" setTitle:@"联系人" setDefault:@"tabbar_contacts" setActive:@"tabbar_contactsHL"];
    
    FindViewController *find =[self createCustomViewController:@"FindViewController" setTitle:@"发现" setDefault:@"tabbar_discover" setActive:@"tabbar_discoverHL"];
    
    MeViewController *me =[self createCustomViewController:@"MeViewController" setTitle:@"我" setDefault:@"tabbar_me" setActive:@"tabbar_meHL"];
    //    2. 设置属性
    
    //    3. 创建导航控制器
    
    
    //    4. 添加导航控制器到标签栏控制
    
    [self addChildViewController:  [self createNavigationController:wechat]];
    [self addChildViewController:  [self createNavigationController:connects]];
    [self addChildViewController:  [self createNavigationController:find]];
    [self addChildViewController:  [self createNavigationController:me]];
    
    
}


- (UIViewController *)createCustomViewController:(NSString *)controller setTitle:(NSString *)title setDefault:(NSString *)defaultImage setActive:(NSString *)activeImage{
    //    使用class的方式初始化
    Class class = NSClassFromString(controller);
    
    UIViewController *vc = [[class alloc] init];
    //    标题文本
    vc.navigationItem.title = title;
    //    底部文字
    vc.tabBarItem.title =title;
    //    默认的图片
    vc.tabBarItem.image = [UIImage imageNamed: defaultImage];
    //    选中的图片
    vc.tabBarItem.selectedImage = [UIImage imageNamed: activeImage];
    //    设置选择的颜色
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:34/255.0 green:172/255.0 blue:37/255.0 alpha:1.0]} forState:UIControlStateHighlighted];
    return vc;
}

/**
 创建导航控制器
 */
- (UINavigationController *)createNavigationController:(UIViewController *)controller{
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:controller];
    //    设置标题栏背景色
    nvc.navigationBar.barTintColor= [UIColor colorWithRed:15/255.0 green:15/255.0 blue:15/255.0 alpha:15/255.0];
    //    设置标题等，前景颜色
    [nvc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.whiteColor}];
    return nvc;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
