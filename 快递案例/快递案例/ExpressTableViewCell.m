//
//  ExpressTableViewCell.m
//  快递案例
//
//  Created by alexganggao on 2020/7/2.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "ExpressTableViewCell.h"

@implementation ExpressTableViewCell

- (void)initExpress:(Express *)express{
    self.time.text = express.datetime;
    self.address.text =express.remark;

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
