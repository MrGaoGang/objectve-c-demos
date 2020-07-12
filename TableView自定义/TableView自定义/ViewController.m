//
//  ViewController.m
//  自定义Cell-微信XIB
//
//  Created by stu1 on 2018/11/5.
//  Copyright © 2018年 abc. All rights reserved.
//

#import "ViewController.h"
#import "WeChatTableViewCell.h"
#import "WechatTableViewCellXIB.h"
#import "WeChatModel.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray<WeChatModel *> *wechats;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.wechats= [[[WeChatModel alloc]init] getModels];
    
    //注册cell
    //在当前的工程目录下通过名字找到xib
    UINib *nib = [UINib nibWithNibName:@"WechatTableViewCellXIB" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"abc"];
}

// 这里的demo只有一行
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

// 每一哥分类下有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.wechats.count;
    
}
// 每一行具体的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WechatTableViewCellXIB *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    
    [cell configCell: self.wechats[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
// 移除多余的空白行
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]init];
}
@end
