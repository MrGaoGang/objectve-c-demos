//
//  ViewController.m
//  SQLite数据库操作
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
#import "DBTools.h"
@interface ViewController ()
- (IBAction)createDB:(id)sender;
- (IBAction)createTable:(id)sender;
- (IBAction)insert:(id)sender;
- (IBAction)deleteData:(id)sender;
- (IBAction)updateData:(id)sender;
- (IBAction)queryData:(id)sender;
@property(nonatomic,strong) DBTools *dbTools;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dbTools = [[DBTools alloc] init];
    self.dbTools.dbName = @"person";
}

// 创建数据库
- (IBAction)createDB:(id)sender {
    [self.dbTools createDB];
}
// 创建表格
- (IBAction)createTable:(id)sender {
    [self.dbTools createTable:@"person"];
}
// 插入数据
- (IBAction)insert:(id)sender {
    Person *person = [[Person alloc] initWithName:@"mrgaogang" andPhone:@"12345678900" andAddress:@"中国-广东深圳"];
    [self.dbTools insertPerson:person];
}
// 删除数据
- (IBAction)deleteData:(id)sender {
    [self.dbTools deletePerson: @"mrgaogang"];
}
// 更新数据
- (IBAction)updateData:(id)sender {
    NSArray *array = [self.dbTools queryPersonByName:@"mrgaogang"];
    if(array.count > 0){
        Person *person = [array firstObject];
        [self.dbTools updatePerson:person ];
    }
}
// 查询数据
- (IBAction)queryData:(id)sender {
    NSArray *array = [self.dbTools queryPersonByName:@"mrgaogang"];
    if(array.count > 0){
        for (Person *p in array) {
            NSLog(@"%@",p);
        }
    }
    
}
@end
