//
//  MyPoint.h
//  JSCore学习
//
//  Created by alexganggao on 2020/7/12.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN
@class MyPoint;
@protocol MyPointExports <JSExport>
@property double x;
@property double y;
- (NSString *)description;
- (instancetype)initWithX:(double)x y:(double)y;
+ (MyPoint *)makePointWithX:(double)x y:(double)y;
@end


@interface MyPoint : NSObject <MyPointExports>
//- (instancetype)initWithX:(double)x y:(double)y;

@end

NS_ASSUME_NONNULL_END
