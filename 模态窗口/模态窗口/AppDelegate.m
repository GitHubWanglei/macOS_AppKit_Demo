//
//  AppDelegate.m
//  模态窗口
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "AppDelegate.h"
#import "ModeWindow.h"

@interface AppDelegate ()<NSWindowDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) ModeWindow *modeWindow;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.window center];
}

- (IBAction)showModeWindow:(NSButton *)sender {
    
    //模态显示时, 关闭窗口后需要调用结束模态展示的方法
//    [[NSApplication sharedApplication] runModalForWindow:self.modeWindow];
    
    //一般显示
    [self.modeWindow makeKeyAndOrderFront:self];
}

- (ModeWindow *)modeWindow{
    if (!_modeWindow) {
        NSNib *nib = [[NSNib alloc] initWithNibNamed:@"ModeWindow" bundle:nil];
        NSArray *objects;
        if ([nib instantiateWithOwner:self topLevelObjects:&objects]) {
            for (id obj in objects) {
                if ([obj isKindOfClass:[ModeWindow class]]) {
                    _modeWindow = obj;
                    break;
                }
            }
        }
        [_modeWindow center];
        _modeWindow.restorable = NO;
        _modeWindow.delegate = self;
    }
    return _modeWindow;
}

- (void)windowWillClose:(NSNotification *)notification{
    //结束模态显示
//    [[NSApplication sharedApplication] stopModal];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
