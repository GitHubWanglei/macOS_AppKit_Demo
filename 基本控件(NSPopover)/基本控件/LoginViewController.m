//
//  LoginViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/13.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) void (^closeHandler)();

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)loginAction:(NSButton *)sender {
    if (self.closeHandler == nil) {
        return;
    }
    self.closeHandler();
}

- (void)closeHandler:(void (^)())closeHandler{
    self.closeHandler = closeHandler;
}

@end
