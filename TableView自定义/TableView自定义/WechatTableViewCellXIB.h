//
//  WechatTableViewCellXIB.h
//  TableView自定义
//
//  Created by alexganggao on 2020/6/24.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeChatModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WechatTableViewCellXIB : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *pic;

- (void)configCell: (WeChatModel *) wechat;
@end

NS_ASSUME_NONNULL_END
