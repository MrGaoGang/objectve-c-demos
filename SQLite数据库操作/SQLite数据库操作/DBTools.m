//
//  DBTools.m
//  SQLite数据库操作
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "DBTools.h"
#import "Person.h"
#import "sqlite3.h"

@interface DBTools(){
    sqlite3 *sqlite;
}

@end
@implementation DBTools


// 
- (void)createDB{
    //    1. 查找沙盒
    NSString *docPath= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //    2. 拼接数据库
    NSString *dbPath = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@.db",self.dbName]];
    NSLog(@"%@",dbPath);
    
    //    3. 创建数据库，需要传递2个参数，1: 数据库名称(c语言的字符串), 2: 数据库的句柄，后续我们需要使用句柄进行数据库的操作
    int result = sqlite3_open([dbPath UTF8String], &sqlite);
    
    if(result == SQLITE_OK){
        NSLog(@"数据库创建成功");
    }else{
        NSLog(@"数据库创建失败");
    }
}
// 数据库的关闭
- (void) closeDB{
    sqlite3_close(sqlite);
}
// 针对创建表格，增加，删除都可以统一使用执行 sqlite3_exec
- (void) execSQL:(NSString *) sql{
    //    1. 执行之前需要打开数据库
    [self createDB];
    //    2. 创建sql语句
    NSLog(@"%@",sql);
    char *error;
    //    3. 执行sql语句
    int result= sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &error);
    if(result == SQLITE_OK){
        NSLog(@"sql执行成功");
    }else{
        NSLog(@"sql执行失败, %s" ,error);
    }
    //    4. 一定要记得关闭数据库
    [self closeDB];
}

- (void)createTable:(NSString *)tableName{
    NSString *sql = [NSString stringWithFormat: @"create table %@(id integer primary key autoincrement, name text , phone text ,address text)",tableName];
    [self execSQL: sql];
}

- (void)insertPerson:(Person *)person{
    NSString *sql = [NSString stringWithFormat: @"insert into person (name , phone ,address) values ('%@','%@','%@')",person.name,person.phone,person.address];
    [self execSQL: sql];
}


- (void)deletePerson:(NSString *)personName{
    NSString *sql = [NSString stringWithFormat: @"delete from person where name='%@'",personName];
    [self execSQL: sql];
}


- (void)updatePerson:(Person *)person{
    NSString *sql = [NSString stringWithFormat: @"update person set phone='%@' ,address='%@' where name='%@'",person.phone,person.address,person.name];
    [self execSQL:sql];
}

// 查询全部
- (NSArray<Person *> *)queryPerson{
    [self createDB];
    NSString *sql = [NSString stringWithFormat: @"select name,phone,address from person"];
    
    sqlite3_stmt *stmt;
    
    int result= sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    
    NSMutableArray *array = [NSMutableArray array];
    if(result == SQLITE_OK){
        //   遍历结果集
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // 参数为结果集和查询结果集的第几列；且返回的结果为c语言的string
            const char *cName= (const char*) sqlite3_column_text(stmt, 0);
            const char *cPhone= (const char*) sqlite3_column_text(stmt, 1);
            const char *cAddress=   (const char*) sqlite3_column_text(stmt, 2);
            // 要记得将c语言的string 改成NSString
            Person *person = [[Person alloc] initWithName:[NSString stringWithUTF8String:cName] andPhone:[NSString stringWithUTF8String:cPhone] andAddress:[NSString stringWithUTF8String:cAddress]];
            [array addObject:person];
            
        }
    }else{
        NSLog(@"查询失败");
    }
    
    [self closeDB];
    
    return array;
    
}

//  条件查询
- (NSArray<Person *> *)queryPersonByName:(NSString *)personName{
    [self createDB];
    NSString *sql = [NSString stringWithFormat: @"select * from person where name = '%@'",personName];
    
    sqlite3_stmt *stmt;
    
    int result= sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    
    NSMutableArray *array = [NSMutableArray array];
    if(result == SQLITE_OK){
        //   遍历结果集
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // 参数为结果集和查询结果集的第几列；且返回的结果为c语言的string
            const char *cPhone= (const char*) sqlite3_column_text(stmt, 0);
            const char *cAddress=   (const char*) sqlite3_column_text(stmt, 1);
            // 要记得将c语言的string 改成NSString
            Person *person = [[Person alloc] initWithName:personName andPhone:[NSString stringWithUTF8String:cPhone] andAddress:[NSString stringWithUTF8String:cAddress]];
            [array addObject:person];
            
        }
    }else{
        NSLog(@"查询失败");
    }
    
    [self closeDB];
    
    return array;
    
    
}

@end

