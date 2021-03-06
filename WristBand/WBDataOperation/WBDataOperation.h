//
//  WBDataOperation.h
//  WristBand
//
//  Created by zhuzhi on 14/11/27.
//  Copyright (c) 2014年 WB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBSingleton.h"

extern NSString * const WBDataAnalysingFinishedNotification;

@interface WBDataOperation : NSObject

WB_AS_SINGLETON(WBDataOperation, shareInstance)

- (void)startSleep;
- (void)stopSleep;

- (void)analysing;

- (void)bleDidReceiveData:(unsigned char *)data length:(int)length;

- (NSArray *)querySleepData;

@end
