//
//  ViewController.m
//  FMDB的使用
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ViewController.h"
#import "DBTools.h"
@interface ViewController ()
- (IBAction)createDB:(id)sender;
- (IBAction)createTable:(id)sender;
- (IBAction)insertData:(id)sender;
- (IBAction)deleteData:(id)sender;
- (IBAction)queryData:(id)sender;
- (IBAction)insertMutiDatas:(id)sender;
- (IBAction)updateData:(id)sender;
@property(nonatomic,strong) DBTools *dbTools;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dbTools = [[DBTools alloc] init];
}


- (IBAction)createDB:(id)sender {
    [self.dbTools createDB];
}

- (IBAction)createTable:(id)sender {
    
    [self.dbTools createTable];
}

- (IBAction)insertData:(id)sender {
    

}

- (IBAction)deleteData:(id)sender {
    [self.dbTools deleteStudent: @"mrgaogang"];

}
- (IBAction)queryData:(id)sender {
    
    NSArray *array= [self.dbTools queryStudentByName:@"mrgaogang"];
    if(array.count>0){
        for (Student *stu in array) {
            NSLog(@"%@",stu);
        }
    }
    

}

- (IBAction)insertMutiDatas:(id)sender {
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<1000; i++) {
         Student *stu = [[Student alloc] initWithName:@"mrgaogang" andAge:i andSex:@"male"];
        [array addObject:stu];
    }
    [self.dbTools insertStudents: array];
}

- (IBAction)updateData:(id)sender {
     Student *stu = [[Student alloc] initWithName:@"mrgaogang" andAge:100 andSex:@"female"];
    [self.dbTools updateStudent: stu];
}
@end
