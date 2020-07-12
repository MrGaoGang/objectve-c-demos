//
//  ExpressTableViewCell.h
//  快递案例
//
//  Created by alexganggao on 2020/7/2.
//  Copyright © 2020 alexganggao. All rights reserved.
//
#import "Express.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;
- (void) initExpress:(Express *) express;
@end

NS_ASSUME_NONNULL_END
