//
//  Socket.h
//  LoaclSokcet
//
//  Created by yisanmao on 15/9/11.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalSocket : NSObject
- (int)createSockets;
- (void)sendData:(NSData *)data;
- (void)close;
@end
