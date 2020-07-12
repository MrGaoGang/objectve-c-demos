//
//  Express.h
//  快递案例
//
//  Created by alexganggao on 2020/7/2.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Express : NSObject
@property(nonatomic,copy) NSString *datetime;
@property(nonatomic,copy) NSString *remark;
@property(nonatomic,copy) NSString *zone;

- (instancetype) initWithDic:(NSDictionary *) dic;

@end

NS_ASSUME_NONNULL_END
