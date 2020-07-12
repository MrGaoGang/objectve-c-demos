//
//  WechatTableViewCellXIB.m
//  TableView自定义
//
//  Created by alexganggao on 2020/6/24.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "WechatTableViewCellXIB.h"
#import "WeChatModel.h"
@implementation WechatTableViewCellXIB

- (void)configCell:(WeChatModel *)wechat{

    self.pic.image=[UIImage imageNamed: wechat.picName];
    self.time.text= wechat.timeText;
    self.content.text=wechat.contentText;
    self.title.text=wechat.titleText;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
