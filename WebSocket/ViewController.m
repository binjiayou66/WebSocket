//
//  ViewController.m
//  WebSocket
//
//  Created by Andy on 2017/9/18.
//  Copyright © 2017年 Anday. All rights reserved.
//

#import "ViewController.h"
#import "ADWebSocket.h"

@interface ViewController ()

@property (nonatomic, strong) ADWebSocket *socket;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self open:nil];
}

- (void)dealloc
{
    [self.socket close];
    self.socket = nil;
}

- (IBAction)open:(id)sender
{
    self.socket = [[ADWebSocket alloc] initWithURLString:@"ws://localhost:8181/"];
    [self.socket open];
}

- (IBAction)close:(id)sender
{
    [self.socket close];
    self.socket = nil;
}

- (IBAction)sendMessage:(id)sender
{
    [self.socket sendMessage:self.inputTextField.text];
}

@end
