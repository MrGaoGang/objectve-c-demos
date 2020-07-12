//
//  Express.m
//  快递案例
//
//  Created by alexganggao on 2020/7/2.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "Express.h"

@implementation Express

- (instancetype)initWithDic:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
