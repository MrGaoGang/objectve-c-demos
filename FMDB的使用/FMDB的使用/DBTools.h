//
//  DBTools.h
//  FMDB的使用
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBTools : NSObject

- (void) createDB;
- (void) createTable;
- (void) insertStudent:(Student *) student;
- (void) insertStudents:(NSArray<Student *> *) students;

- (void) deleteStudent:(NSString *) stuName;
- (void) updateStudent:(Student *) student;
- (NSArray<Student *>*) queryStudentByName:(NSString *) stuName;

@end

NS_ASSUME_NONNULL_END
