//
//  Person.h
//  SQLite数据库操作
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSString *address;

- (instancetype) initWithName:(NSString *) name andPhone:(NSString *) phone andAddress:(NSString *) address;
@end

NS_ASSUME_NONNULL_END
