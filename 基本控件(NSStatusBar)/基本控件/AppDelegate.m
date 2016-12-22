//
//  AppDelegate.m
//  基本控件
//
//  Created by lihongfeng on 16/12/13.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSStatusItem *statusItem;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    NSStatusItem *item = [statusBar statusItemWithLength:28];
    item.button.image = [NSImage imageNamed:@"arrow.png"];
    item.target = self;
    item.action = @selector(itemAction);
    self.statusItem = item;
    
    [self.window makeKeyAndOrderFront:self];
}

- (void)itemAction{
    NSLog(@"statusItem clicked.");
    [self.window makeKeyAndOrderFront:self];
    [[NSRunningApplication currentApplication] activateWithOptions:NSApplicationActivateAllWindows | NSApplicationActivateIgnoringOtherApps];
    
}

- (void)applicationWillHide:(NSNotification *)notification{
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillResignActive:(NSNotification *)notification{
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    NSLog(@"%s", __FUNCTION__);
}


@end
