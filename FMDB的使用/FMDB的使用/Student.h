//
//  Student.h
//  FMDB的使用
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int age;
@property (nonatomic,copy) NSString *sex;

- (instancetype)initWithName:(NSString *) name andAge:(int) age andSex:(NSString *) sex;

@end

NS_ASSUME_NONNULL_END
