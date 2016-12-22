//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<NSTabViewDelegate>

@property (strong) IBOutlet NSTabView *tabView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加随机背景色
    for (NSInteger i = 0; i < self.tabView.numberOfTabViewItems; i++) {
        NSTabViewItem *item = [self.tabView tabViewItemAtIndex:i];
        item.view.wantsLayer = YES;
        item.view.layer.backgroundColor = [NSColor colorWithRed:arc4random() % 255 / 255.0
                                                          green:arc4random() % 255 / 255.0
                                                           blue:arc4random() % 255 / 255.0
                                                          alpha:1].CGColor;
    }
    
    //设置代理
    self.tabView.delegate = self;
    
}

//添加 item
- (IBAction)addTabItemAction:(NSButton *)sender {
    NSString *identifier = [NSString stringWithFormat:@"item%ld", self.tabView.numberOfTabViewItems];
    NSTabViewItem *newItem = [[NSTabViewItem alloc] initWithIdentifier:identifier];
    newItem.label = identifier;
    NSView *itemView = [[NSView alloc] initWithFrame:self.tabView.bounds];
    itemView.wantsLayer = YES;
    itemView.layer.backgroundColor = [NSColor colorWithRed:arc4random() % 255 / 255.0
                                                     green:arc4random() % 255 / 255.0
                                                      blue:arc4random() % 255 / 255.0
                                                     alpha:1].CGColor;
    newItem.view = itemView;
    [self.tabView addTabViewItem:newItem];
}

//删除 item
- (IBAction)deleteItemAction:(NSButton *)sender {
    if (self.tabView.numberOfTabViewItems > 0) {
        [self.tabView removeTabViewItem:[self.tabView tabViewItemAtIndex:self.tabView.numberOfTabViewItems - 1]];
    }
}

#pragma mark - NSTabViewDelegate

- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(nullable NSTabViewItem *)tabViewItem{
    NSLog(@"label: %@", tabViewItem.label);
    NSLog(@"identifier: %@", tabViewItem.identifier);
}

@end













