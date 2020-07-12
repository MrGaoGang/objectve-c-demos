//
//  ViewController.m
//  JSCore学习
//
//  Created by alexganggao on 2020/7/10.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
//#import <JavaScriptCore/JavaScriptCore.h>
#import "MyPoint.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // OC调用JS
    //    JSContext *context = [[JSContext alloc] init];
    //    NSString *js = @"function add(a,b) {return a+b}";
    //    [context evaluateScript:js];
    //    JSValue *n = [context[@"add"] callWithArguments:@[@6,@3]];
    //    NSLog(@"---%@", @([n toInt32]));//---9
    //
    //    // JS调用OC
    //    JSContext *ctx = [[JSContext alloc] init];
    //    ctx[@"minus"] = ^int(int a, int b) {
    //        return a - b;
    //    };
    //    JSValue *value = [ctx evaluateScript:@"minus(4, 5)"];
    //    NSLog(@"4 minus 5 = %d", [value toInt32]);
    //
    
    JSContext *ctx = [[JSContext alloc] init];
    ctx.exceptionHandler = ^(JSContext *context, JSValue *exception){
        [JSContext currentContext].exception = exception;
        NSLog(@"exception:%@",exception);
    };
    ctx[@"point"] =  [[MyPoint alloc] initWithX:8.0 y:7.0];
    //    ctx[@"point"] = MyPoint all
    ctx[@"MyPoint"] = MyPoint.class;
    NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle bundleForClass:self.class]pathForResource:@"script.js" ofType:nil]];
    [ctx evaluateScript:[[NSString alloc] initWithContentsOfURL:fileURL encoding:(NSUTF8StringEncoding) error:nil]];
    
}


@end
