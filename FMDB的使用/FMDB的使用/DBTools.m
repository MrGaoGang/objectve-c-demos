//
//  DBTools.m
//  FMDB的使用
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "DBTools.h"
#import "FMDB.h"

@interface DBTools ()

@property (strong,nonatomic) FMDatabase *fmdb;

@end
@implementation DBTools

- (void) createDB{
    //    1. 找到沙盒路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //   2. 找到db文件
    NSString *fileName =  [docPath stringByAppendingPathComponent: @"student.db"];
    
    self.fmdb = [FMDatabase databaseWithPath:fileName];
    
    BOOL success = [self.fmdb open];
    
    if(success){
        NSLog(@"打开数据库成功");
    }else{
        NSLog(@"打开数据库失败");
        
    }
    
}


- (void) createTable{
    //用之前一定要打开数据库
    [self createDB];
    
    NSString *sql = @"create table t_stu(id integer primary key autoincrement, name text,  age integer, sex text)";
    
    BOOL isSuccess = [self.fmdb executeUpdate:sql];
    
    if(isSuccess){
        NSLog(@"创建表成功");
    }
    else{
        NSLog(@"创建表失败");
    }
    
    //用完关闭数据库
    [self.fmdb close];
    
}
- (void) insertStudent:(Student *) student{
    
    [self createDB];
    
    NSString *sql = @"insert into t_stu(name,age,sex) values (?,?,?)";
    // 注意FMDB操作数据必须使用对象，age是int类型，不符合，所以需要转换成对象的方式
    BOOL isSuccess = [self.fmdb executeUpdate:sql,student.name,@(student.age),student.sex];
    
    if(isSuccess){
        NSLog(@"插入成功");
    }
    else{
        NSLog(@"插入失败");
    }
    
    //用完关闭数据库
    [self.fmdb close];
    
}

- (void)insertStudents:(NSArray<Student *> *)students{
    [self createDB];
    //    开启事务
    [self.fmdb beginTransaction];
    
    @try {
        for (Student *student in students) {
            NSString *sql = @"insert into t_stu(name,age,sex) values (?,?,?)";
            // 注意FMDB操作数据必须使用对象，age是int类型，不符合，所以需要转换成对象的方式
            BOOL isSuccess = [self.fmdb executeUpdate:sql,student.name,@(student.age),student.sex];
            
            if(isSuccess){
                NSLog(@"插入成功");
            }
            else{
                NSLog(@"插入失败");
            }
        }
    } @catch (NSException *exception) {
        //   回滚数据
        [self.fmdb rollback];
    } @finally {
        [self.fmdb commit];
    }
    
    
    //用完关闭数据库
    [self.fmdb close];
}

- (void) deleteStudent:(NSString *) stuName{
    
    [self createDB];
    
    NSString *sql = @"delete from t_stu where name=?";
    
    BOOL isSuccess = [self.fmdb executeUpdate:sql,stuName];
    
    if(isSuccess){
        NSLog(@"删除成功");
    }
    else{
        NSLog(@"删除失败");
    }
    
    //用完关闭数据库
    [self.fmdb close];
    
}
- (void) updateStudent:(Student *) student{
    [self createDB];
    
    NSString *sql = @"update t_stu set age=? , sex=? where name=?";
    
    BOOL isSuccess = [self.fmdb executeUpdate:sql,@(student.age),student.sex,student.name];
    
    if(isSuccess){
        NSLog(@"更新成功");
    }
    else{
        NSLog(@"更新失败");
    }
    
    //用完关闭数据库
    [self.fmdb close];
    
}
- (NSArray<Student *>*) queryStudentByName:(NSString *) stuName{
    [self createDB];
    
    NSString *sql = @"select name,age,sex from  t_stu  where name=?";
    
    FMResultSet *resultSet=[self.fmdb executeQuery:sql,stuName];
    
    NSMutableArray *array = [NSMutableArray array];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSString *sex = [resultSet stringForColumn:@"sex"];
        Student *stu = [[Student alloc] initWithName:name andAge:age andSex:sex];
        [array addObject:stu];
    }
    
    //用完关闭数据库
    [self.fmdb close];
    return array;
}



@end
