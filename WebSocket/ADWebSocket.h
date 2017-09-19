//
//  ADWebSocket.h
//  WebSocket
//
//  Created by Andy on 2017/9/18.
//  Copyright © 2017年 Anday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket.h>

@interface ADWebSocket : NSObject

/// Initial function with url string
- (instancetype)initWithURLString:(NSString *)url;

/// Open
- (void)open;
/// Close
- (void)close;
- (void)closeWithCode:(NSInteger)code reason:(NSString *)reason;

/// Send Message
- (void)sendMessage:(id)message;

@end
