//
//  CustomPanel.m
//  自定义面板
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "CustomPanel.h"

@implementation CustomPanel

- (IBAction)cancelAction:(NSButton *)sender {
    [self.parentWindow endSheet:self returnCode:1];
}

- (IBAction)okAction:(NSButton *)sender {
    [self.parentWindow endSheet:self returnCode:2];
}


@end
