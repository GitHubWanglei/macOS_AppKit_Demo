//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/14.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)initData{
    self.dataSource = @[@{@"name": @"John", @"address": @"USA", @"gender": @"Male", @"married": @(1)},
                        @{@"name": @"Mary", @"address": @"China", @"gender": @"Female", @"married": @(0)},
                        @{@"name": @"Jack", @"address": @"Japan", @"gender": @"Male", @"married": @(0)},
                        @{@"name": @"Tom", @"address": @"Russia", @"gender": @"Male", @"married": @(1)}];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.dataSource.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *rowInfoDic = self.dataSource[row];
    NSString *rowData = rowInfoDic[tableColumn.identifier];
    return rowData;
}

@end







