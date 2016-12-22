//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSplitView *splitView = [[NSSplitView alloc] initWithFrame:self.view.bounds];
    splitView.vertical = YES;
    splitView.dividerStyle = NSSplitViewDividerStyleThin;
    
    NSView *leftView = [[NSView alloc] initWithFrame:CGRectZero];
    leftView.autoresizingMask = 0;
    leftView.autoresizesSubviews = YES;
    leftView.wantsLayer = YES;
    leftView.layer.backgroundColor = [NSColor darkGrayColor].CGColor;
    
    NSView *rightView = [[NSView alloc] initWithFrame:CGRectZero];
    rightView.autoresizingMask = 0;
    rightView.autoresizesSubviews = YES;
    rightView.wantsLayer = YES;
    rightView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [splitView addSubview:leftView];
    [splitView addSubview:rightView];
    
    [self.view addSubview:splitView];
    
    //添加约束
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(self.view.bounds.size.width/4));
        make.width.lessThanOrEqualTo(@(self.view.bounds.size.width/2));
    }];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(self.view.bounds.size.width/2));
        make.width.lessThanOrEqualTo(@(self.view.bounds.size.width/4*3));
    }];
    
}


@end
