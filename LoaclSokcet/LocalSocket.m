//
//  Socket.m
//  LoaclSokcet
//
//  Created by yisanmao on 15/9/11.
//  Copyright (c) 2015年 zmw. All rights reserved.
//

#import "LocalSocket.h"
#include <sys/types.h>
#include <sys/socket.h>

@interface LocalSocket()
{
    int fdOne;
    int fdTwo;
}
@end

@implementation LocalSocket
- (int)createSockets
{
    int socketFd[2];
    
    int res = socketpair(AF_LOCAL, SOCK_STREAM, 0, socketFd);
    if (res < 0)
    {
        NSLog(@"create socket pair error:%d", res);
    }
    
    fdOne = socketFd[0];
    fdTwo = socketFd[1];
    
    return fdTwo;
}

- (void)sendData:(NSData *)data
{
    const char *bytes = [data bytes];
    write(fdOne, bytes, strlen(bytes));
}

- (void)close
{
    close(fdOne);
    close(fdTwo);
}@end
