//
//  ViewController.m
//  快递案例
//
//  Created by alexganggao on 2020/7/2.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
#import "Express.h"
#import "ExpressTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *arrays;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSMutableArray *)arrays{
    if(_arrays == nil){
        _arrays= [[NSMutableArray alloc] initWithCapacity:6];
    }
    return _arrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.rowHeight=100.0;
    self.tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
    
    UINib *nib = [UINib nibWithNibName:@"ExpressTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell-a"];
    
    [self getMessage];
    
}

- (void) getMessage{
    NSURL *url= [[NSURL alloc] initWithString:@"http://v.juhe.cn/exp/index?key=3aecda3a6394c64594b2790f6e1de257&com=sf&no=446505105190"];
    NSURLRequest *request = [[NSURLRequest alloc ] initWithURL:url];
    //    自定义请求配置
    //    NSURLSessionConfiguration *config = [[NSURLSessionConfiguration alloc] init];
    //    config.timeoutIntervalForRequest= 20;// 请求超超时时间
    //    //...还有很多参数
    //    NSURLSession *session = [NSURLSession sessionWithConfiguration: config];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task=  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSHTTPURLResponse *http = (NSHTTPURLResponse *)response;
            if(http.statusCode==200){
                /** NSJSONReadingOptions
                 *    NSJSONReadingMutableContainers  = (1UL << 0),
                 *    容器可变，NSMutableDictionary 或NSMutableArray。
                 *
                 *    NSJSONReadingMutableLeaves      = (1UL << 1),
                 *    叶子可变，返回的 JSON 对象中字符串的值为 NSMutableString。
                 *
                 *    NSJSONReadingAllowFragments     = (1UL << 2)
                 *    允许 JSON 字符串最外层既不是 NSArray 也不是 NSDictionary，但必须是有效的 JSON 片段
                 */
                
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSArray *list = dic[@"result"][@"list"];
                for (int i=0; i<list.count; i++) {
                    NSDictionary *item = list[i];
                    Express *express = [[Express alloc] initWithDic:item];
                    [self.arrays addObject:express];
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"%@",self.arrays);
                    [self.tableView reloadData];
                });
                
                
            }else{
                NSLog(@"请求失败，响应报文为:%ld",http.statusCode);
                
            }
        }else{
            NSLog(@"快读请求失败,%@",error);
        }
    }];
    [task resume];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Express *express = self.arrays[indexPath.row];
    ExpressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell-a"];;
    [cell initExpress:express];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.arrays.count;
}

@end
