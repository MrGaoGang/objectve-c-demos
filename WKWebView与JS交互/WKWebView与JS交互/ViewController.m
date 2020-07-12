//
//  ViewController.m
//  WKWebView与JS交互
//
//  Created by alexganggao on 2020/7/9.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
#import "WebKit/WebKit.h"
@interface ViewController ()<WKScriptMessageHandler>
@property (weak, nonatomic) IBOutlet UILabel *h5ToOC1;
@property (weak, nonatomic) IBOutlet UILabel *h5ToOC2;
- (IBAction)ocToH5:(id)sender;
@property(nonatomic,strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 默认为0
    config.preferences.minimumFontSize = 10;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    
    CGSize size=  UIScreen.mainScreen.bounds.size;
    // 初始化webview
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height/2) configuration:config];
    
    [self registerJSCallOCMethod:config];
    
    [self loadHTML];
    
    [self.view addSubview:self.webView];
    
}

/**
 使用webview加载url
 */
- (void) loadHTML{
    //    加载本地的地址
    //    NSString *html = [NSBundle.mainBundle pathForResource:@"index" ofType:@"html"];
    //    NSURL *url = [[NSBundle mainBundle] bundleURL];
    //    [self.webView loadHTMLString:[NSString stringWithContentsOfFile: html encoding:NSUTF8StringEncoding error:nil]  baseURL: url ];
    
    // 加载远程的URL,10.66.147.65请换成自己本地的ip地址
    NSURL *url = [[NSURL alloc] initWithString:@"http://10.66.147.65:3000"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

// JS调用OC代码，需要在OC端先注册有哪些方法，这样才能在WKScriptMessageHandler的协议方法实现
- (void) registerJSCallOCMethod: (WKWebViewConfiguration *) config{
    if(config!=nil){
        WKUserContentController *controller = config.userContentController;
        [controller addScriptMessageHandler:self name:@"h5ToOC1"];
        [controller addScriptMessageHandler:self name:@"h5ToOC2"];
    }
}

// 记得实现 WKScriptMessageHandler  协议，此方法的主要功能是处理JS调用过来的数据
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSString *methodName = message.name;
    if ([methodName isEqualToString:@"h5ToOC1"]) {
        // 一个参数获取String
        NSString *info = [NSString stringWithFormat:@"%@",message.body];
        self.h5ToOC1.text = info;
    }else if([methodName isEqualToString:@"h5ToOC2"]){
        // 两个参数的话，需要按照传递的格式解析成对应的，因为传递过来的是数组，所以我们需要使用array接收
        NSArray *array = message.body;
        NSString *info = [NSString stringWithFormat:@"有两个参数: %@, %@ ",array.firstObject,array.lastObject];
        
        self.h5ToOC2.text = info;
    }
}


- (IBAction)ocToH5:(id)sender {
    [self.webView evaluateJavaScript:@"ocToH51('你好，mrgaogang','mrgaogang.github.io')" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        //JS 返回结果
        NSLog(@"%@ %@",response,error);
    }];
}



//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//
//    NSLog(@"viewDidDisappear");
//    WKUserContentController *container = self.webView.configuration.userContentController;
//    [container removeScriptMessageHandlerForName:@"h5ToOC1"];
//    [container removeScriptMessageHandlerForName:@"h5ToOC2"];
//
//}



- (void)dealloc{
    WKUserContentController *container = self.webView.configuration.userContentController;
    [container removeScriptMessageHandlerForName:@"h5ToOC1"];
    [container removeScriptMessageHandlerForName:@"h5ToOC2"];
}
@end
