//
//  ADWebSocket.m
//  WebSocket
//
//  Created by Andy on 2017/9/18.
//  Copyright © 2017年 Anday. All rights reserved.
//

#import "ADWebSocket.h"

@interface ADWebSocket ()<SRWebSocketDelegate>

@property (nonatomic, strong) SRWebSocket *socket;

@end

@implementation ADWebSocket

#pragma mark - life cycle

- (instancetype)initWithURLString:(NSString *)url;
{
    if (self = [super init]) {
        self.socket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:url]];
        self.socket.delegate = self;
    }
    return self;
}

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"KKK" object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSString *messageString = [[NSString alloc] initWithData:message encoding:NSUTF8StringEncoding];
    NSLog(@"[%s]..%@", __FUNCTION__, messageString);
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"[%s]", __FUNCTION__);
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"[%s]", __FUNCTION__);
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    NSLog(@"[%s]..%ld..%@..%d", __FUNCTION__, code, reason, wasClean);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
    NSString *pongString = [[NSString alloc] initWithData:pongPayload encoding:NSUTF8StringEncoding];
    NSLog(@"[%s]..%@", __FUNCTION__, pongString);
}

- (BOOL)webSocketShouldConvertTextFrameToString:(SRWebSocket *)webSocket
{
    return NO;
}

#pragma mark - public method 

- (void)open
{
    [self.socket open];
}

- (void)close
{
    [self.socket close];
}

- (void)closeWithCode:(NSInteger)code reason:(NSString *)reason
{
    [self.socket closeWithCode:code reason:reason];
}

- (void)sendMessage:(id)message
{
    if (self.socket.readyState != SR_OPEN) {
        return;
    }
    [self.socket send:message];
}

#pragma mark - getter and setter

@end
