//
//  AppDelegate.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSMenu *dockMenu;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (NSMenu *)applicationDockMenu:(NSApplication *)sender {
    return self.dockMenu;
}

- (IBAction)dockItem1Action:(id)sender {
    NSLog(@"Dock菜单: item1");
}

- (IBAction)dockItem2Action:(id)sender {
    NSLog(@"Dock菜单: item2");
}

- (IBAction)dockItem3Action:(id)sender {
    NSLog(@"Dock菜单: item3");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
