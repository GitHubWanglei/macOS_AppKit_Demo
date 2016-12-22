//
//  MainWindowController.m
//  自定义面板
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "MainWindowController.h"
#import "MainViewController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.window.restorable = NO;
    [self.window center];
    self.window.contentViewController = [[MainViewController alloc] init];
}

- (NSString *)windowNibName{
    return @"MainWindowController";
}

@end
