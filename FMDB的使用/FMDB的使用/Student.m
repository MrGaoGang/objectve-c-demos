//
//  Student.m
//  FMDB的使用
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name andAge:(int)age andSex:(NSString *)sex{
    if(self = [super init]){
        self.name= name;
        self.age= age;
        self.sex = sex;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@ , age = %d , sex = %@ , ", self.name ,self.age ,self.sex];
}

@end
