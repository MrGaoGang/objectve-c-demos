//
//  Person.m
//  SQLite数据库操作
//
//  Created by alexganggao on 2020/6/28.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name andPhone:(NSString *)phone andAddress:(NSString *)address{
    if(self = [super init]){
        self.name= name;
        self.phone=phone;
        self.address=address;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@ , phone = %@, address = %@", self.name,self.phone,self.address];
}
@end
