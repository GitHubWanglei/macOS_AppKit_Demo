//
//  MainWindowController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/13.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
//    self.window.titleVisibility = NSWindowTitleHidden;
}
- (IBAction)open:(NSToolbarItem *)sender {
    NSLog(@"-------Open");
}

//-(BOOL)validateToolbarItem:(NSToolbarItem *)item{
//    if ([item.itemIdentifier isEqualToString:@"Open"]) {
//        return NO;
//    }
//    return YES;
//}

@end
