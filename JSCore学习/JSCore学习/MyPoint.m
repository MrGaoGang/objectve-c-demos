//
//  MyPoint.m
//  JSCore学习
//
//  Created by alexganggao on 2020/7/12.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "MyPoint.h"

@interface MyPoint()
- (void)myPrivateMethod;// Not in the MyPointExports protocol, so not visible to JavaScript code.
@end

@implementation MyPoint

- (instancetype)initWithX:(double)x y:(double)y{
    self = [super init];
    if (self) {
        self.x=x;
        self.y=y;
    }
    return self;
}

- (NSString *)description
{
    NSLog(@"x=%f,y=%f", self.x,self.y);
    return [NSString stringWithFormat:@"x=%f,y=%f", self.x,self.y];
}

+ (MyPoint *)makePointWithX:(double)x y:(double)y{
    MyPoint *point = [[MyPoint alloc] init];
    point.x=x;
    point.y=y;
    return point;
}

- (void)myPrivateMethod{
    
}


@synthesize x;

@synthesize y;

@end
