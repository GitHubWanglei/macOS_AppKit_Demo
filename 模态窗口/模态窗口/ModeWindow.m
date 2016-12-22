//
//  ModeWindow.m
//  模态窗口
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ModeWindow.h"

@implementation ModeWindow

- (IBAction)cancelAction:(NSButton *)sender {
    [self close];
}

- (IBAction)okAction:(NSButton *)sender {
    [self close];
}


- (void)dealloc{
    NSLog(@"释放 window");
}
@end
