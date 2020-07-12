//
//  DBTools.h
//  SQLite数据库操作
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBTools : NSObject
// 创建db
- (void) createDB;
// 创建表
- (void) createTable:(NSString *) tableName;
// 插入数据
- (void) insertPerson:(Person *) person;
// 条件删除
- (void) deletePerson:(NSString *) personName;
// 更新数据
- (void) updatePerson:(Person *) person;
// 查询所有数据
- (NSArray<Person *> *) queryPerson;
// 通过条件查询
- (NSArray<Person *> *) queryPersonByName:(NSString *) personName;

@property(nonnull,copy) NSString *dbName;


@end

NS_ASSUME_NONNULL_END
