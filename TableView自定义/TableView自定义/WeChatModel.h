//
//  WeChatModel.h
//  TableView自定义
//
//  Created by alexganggao on 2020/6/23.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeChatModel : NSObject

@property(nonatomic,copy) NSString *picName;
@property(nonatomic,copy) NSString *titleText;
@property(nonatomic,copy) NSString *timeText;
@property(nonatomic,copy) NSString *contentText;

- (NSMutableArray *) getModels;
@end

NS_ASSUME_NONNULL_END
