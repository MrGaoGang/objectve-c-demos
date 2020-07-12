//
//  ViewController.m
//  多线程Demo
//
//  Created by alexganggao on 2020/7/6.
//  Copyright © 2020 alexganggao. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign)   NSInteger count;
@property (nonatomic, strong)   dispatch_source_t tTimer;  //GCD计时器一定要设置为成员变量， 否则会立即释放

@end

@implementation ViewController

@synthesize tTimer;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //创建GCD timer资源， 第一个参数为源类型， 第二个参数是资源要加入的队列
    self.tTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    //设置timer信息， 第一个参数是我们的timer对象， 第二个是timer首次触发延迟时间， 第三个参数是触发时间间隔 n* 秒， 最后一个是是timer触发允许的延迟值， 建议值是十分之一
    dispatch_source_set_timer(self.tTimer,
                              dispatch_walltime(NULL, 0 * NSEC_PER_SEC),
                              1 * NSEC_PER_SEC,
                              0);
    
    //设置timer的触发事件
    dispatch_source_set_event_handler(self.tTimer, ^{
        
        [self logCount];
    });
    
    //激活timer对象
    dispatch_resume(self.tTimer);
}


- (void)logCount {
    
    self.count ++;
    NSLog(@"Count = %ld", self.count);
    
    if (self.count > 99) {
        
        self.count = 0;
        //暂停timer对象
        dispatch_suspend(self.tTimer);
        
        //销毁timer, 注意暂停的timer资源不能直接销毁， 需要先resume再cancel， 否则会造成内存泄漏
        //dispatch_source_cancel(self.tTimer);
    }
}
@end
