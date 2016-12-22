//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong) IBOutlet NSSearchField *searchField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSButtonCell *searchCell = [[self.searchField cell] searchButtonCell];
    NSButtonCell *cancelCell = [[self.searchField cell] cancelButtonCell];
    searchCell.target = self;
    cancelCell.target = self;
    searchCell.action = @selector(clickSearchButton:);
    cancelCell.action = @selector(clickCancelButton:);
    
}

- (void)clickSearchButton:(NSButtonCell *)sender{
    NSLog(@"点击了搜索按钮");
}

- (void)clickCancelButton:(NSButtonCell *)sender{
    NSLog(@"点击了取消按钮");
    self.searchField.stringValue = @"";
}

- (IBAction)searchAction:(NSSearchField *)sender {
    
    NSLog(@"----%@", sender.stringValue);
    
}

@end
