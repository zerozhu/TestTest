//
//  WBBaseCell.h
//  WristBand
//
//  Created by zhuzhi on 14/11/9.
//  Copyright (c) 2014年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBSleepInfo.h"

@interface WBBaseCell : UITableViewCell

@property (nonatomic,strong)WBSleepInfo *sleepInfo;

- (CGFloat)cellHeight;
- (void)configCell;

@end
