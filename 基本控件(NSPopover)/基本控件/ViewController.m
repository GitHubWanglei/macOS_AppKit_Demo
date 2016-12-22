//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "ShareViewController.h"
#import "ShowViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSPopover *sharePopover;
@property (nonatomic, strong) NSPopover *showPopover;
@property (nonatomic, strong) NSPopover *loginPopover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)shareAction:(NSButton *)sender {
    [self.sharePopover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMaxY];
}

- (IBAction)showAction:(NSButton *)sender {
    [self.showPopover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMinY];
}

- (IBAction)loginAction:(NSButton *)sender {
    [self.loginPopover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMinY];
}

- (NSPopover *)sharePopover {
    if (!_sharePopover) {
        _sharePopover = [[NSPopover alloc] init];
        _sharePopover.contentViewController = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
        _sharePopover.behavior = NSPopoverBehaviorTransient;
    }
    return _sharePopover;
}

- (NSPopover *)showPopover {
    if (!_showPopover) {
        _showPopover = [[NSPopover alloc] init];
        _showPopover.contentViewController = [[ShowViewController alloc] initWithNibName:@"ShowViewController" bundle:nil];
        _showPopover.behavior = NSPopoverBehaviorSemitransient;
    }
    return _showPopover;
}

- (NSPopover *)loginPopover {
    if (!_loginPopover) {
        _loginPopover = [[NSPopover alloc] init];
        LoginViewController *contentVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        __weak __block typeof(self) weakSelf = self;
        [contentVC closeHandler:^{
            [weakSelf.loginPopover close];
        }];
        _loginPopover.contentViewController = contentVC;
        _loginPopover.behavior = NSPopoverBehaviorApplicationDefined;
    }
    return _loginPopover;
}


@end













