//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSTextFieldDelegate, NSTextViewDelegate>

@property (strong) IBOutlet NSTextField *textField;
@property (strong) IBOutlet NSTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textView.delegate = self;
    
}

#pragma mark - NSTextFieldDelegate

- (void)controlTextDidChange:(NSNotification *)obj {
    NSLog(@"%s", __FUNCTION__);
    if (self.textField == obj.object) {
        NSLog(@"----------%@", self.textField.stringValue);
    }
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    NSLog(@"%s", __FUNCTION__);
}

- (void)controlTextDidBeginEditing:(NSNotification *)obj {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - NSTextViewDelegate

- (BOOL)textShouldBeginEditing:(NSText *)textObject {
    return YES;
}

- (BOOL)textShouldEndEditing:(NSText *)textObject {
    return YES;
}

- (void)textDidBeginEditing:(NSNotification *)notification{
    NSLog(@"%s", __FUNCTION__);
}

- (void)textDidEndEditing:(NSNotification *)notification{
    NSLog(@"%s", __FUNCTION__);
}

- (void)textDidChange:(NSNotification *)notification {
    NSLog(@"%s", __FUNCTION__);
    self.textView = notification.object;
    NSLog(@"~~~~~~~~~~~%@", self.textView.string);
}


@end
