//
//  AppDelegate.m
//  自定义面板
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MainWindowController *mainwindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.mainwindowController showWindow:self];
}

- (MainWindowController *)mainwindowController{
    if (!_mainwindowController) {
        _mainwindowController = [[MainWindowController alloc] init];
    }
    return _mainwindowController;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
