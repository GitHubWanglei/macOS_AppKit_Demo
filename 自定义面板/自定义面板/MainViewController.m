//
//  MainViewController.m
//  自定义面板
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "MainViewController.h"
#import "CustomPanel.h"

@interface MainViewController ()

@property (nonatomic, strong) CustomPanel *panel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}

- (IBAction)showCustomPanelAction:(NSButton *)sender {
    self.panel.parentWindow = self.view.window;
    [self.view.window beginSheet:self.panel completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"returnCode: %ld", (long)returnCode);
        if (returnCode == 1) {
            NSLog(@"取消");
        }else{
            NSLog(@"确定");
        }
    }];
}

- (CustomPanel *)panel {
    if (!_panel) {
        NSNib *nib = [[NSNib alloc] initWithNibNamed:@"CustomPanel" bundle:nil];
        NSArray *topLevelObjects;
        if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
            for (id object in topLevelObjects) {
                if ([object isKindOfClass:[CustomPanel class]]) {
                    _panel = object;
                    break;
                }
            }
        }
        _panel.restorable = NO;
        [_panel center];
    }
    return _panel;
}


@end
