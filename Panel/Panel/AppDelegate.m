//
//  AppDelegate.m
//  Panel
//
//  Created by lihongfeng on 16/12/9.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MainWindowController *mainWindowController;

@end

@implementation AppDelegate

- (IBAction)openFile:(id)sender {
    NSLog(@"------open file.");
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.mainWindowController showWindow:self];
}

- (MainWindowController *)mainWindowController{
    if (!_mainWindowController) {
        _mainWindowController = [[MainWindowController alloc] init];
    }
    return _mainWindowController;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
