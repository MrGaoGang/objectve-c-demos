//
//  SecondViewController.h
//  控制器的跳转
//
//  Created by alexganggao on 2020/6/25.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <UIKit/UIKit.h>
// 1. 定义协议
@protocol passValueProtocol <NSObject>
// 声明一个方法，传递值给第一个页面，传递的参数为NSString的类型，当然 如果你要传递的类型为其他的类型请注意参数类型
- (void) passValueToOne:(NSString *) value;

@end

NS_ASSUME_NONNULL_BEGIN
// 1. 定义block
typedef void (^ PassValueBlock)(NSString *info);

@interface SecondViewController : UIViewController
@property(nonatomic,copy) NSString *passValue;//用来接收上一个页面传递过来的值
// 2. 定义一个属性，必须遵循passValueProtocol协议
@property(nonatomic,assign) id <passValueProtocol> delegate;
// 2. 声明属性
@property(nonatomic,copy) PassValueBlock passValueBlock;
@end

NS_ASSUME_NONNULL_END
