//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/15.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CustomTableRowView.h"
#import "CustomTableCellView.h"

@interface ViewController ()<NSTableViewDelegate, NSTableViewDataSource>

@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSScrollView *tableViewScrollView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewScrollView.documentView = self.tableView;
    [self.view addSubview:self.tableViewScrollView];
    
    [self.tableViewScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-30);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
    }];
}

#pragma mark - Lazy load

- (NSTableView *)tableView {
    if (!_tableView) {
        _tableView = [[NSTableView alloc] init];
        _tableView.autoresizingMask = YES;
        _tableView.gridStyleMask = NSTableViewDashedHorizontalGridLineMask | NSTableViewSolidVerticalGridLineMask;
        _tableView.rowHeight = 30;
        
        //创建 column
        NSTableColumn *nameColumn = [[NSTableColumn alloc] initWithIdentifier:@"name"];
        nameColumn.title = @"name";
        nameColumn.minWidth = 150;
        nameColumn.resizingMask = NSTableColumnUserResizingMask;
        NSTableColumn *addressColumn = [[NSTableColumn alloc] initWithIdentifier:@"address"];
        addressColumn.title = @"address";
        addressColumn.minWidth = 100;
        addressColumn.resizingMask = NSTableColumnUserResizingMask;
        
        [_tableView addTableColumn:nameColumn];
        [_tableView addTableColumn:addressColumn];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSScrollView *)tableViewScrollView {
    if (!_tableViewScrollView) {
        _tableViewScrollView = [[NSScrollView alloc] init];
        _tableViewScrollView.hasVerticalScroller = YES;
        _tableViewScrollView.hasHorizontalScroller = YES;
        _tableViewScrollView.autohidesScrollers = YES;
    }
    return _tableViewScrollView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[@{@"name": @"Jack", @"address": @"China"},
                                                       @{@"name": @"Lily", @"address": @"USA"},
                                                       @{@"name": @"Tom", @"address": @"Canada"},
                                                       @{@"name": @"Lucy", @"address": @"Russia"},
                                                       @{@"name": @"John", @"address": @"Japan"}]];
    }
    return _dataSource;
}

#pragma mark - NSTableViewDelegate

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *rowInfoDic = self.dataSource[row];
    NSString *dataString = rowInfoDic[tableColumn.identifier];
    
    CustomTableCellView *contentView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if (!contentView) {
        contentView = [[CustomTableCellView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    }
    contentView.string = dataString;
    
    return contentView;
}

//自定义 row view
- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    CustomTableRowView *rowView = [tableView makeViewWithIdentifier:@"rowView" owner:self];
    if (rowView == nil) {
        rowView = [[CustomTableRowView alloc] init];
        rowView.identifier = @"rowView";
    }
    return rowView;
}

#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.dataSource.count;
}

#pragma mark ***** Notifications *****

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    
    NSTableView *tableView = notification.object;
    NSLog(@"---selection row %ld", tableView.selectedRow);
//    CustomTableCellView *contentView = [tableView makeViewWithIdentifier:@"name" owner:self];
    
    CustomTableCellView *contentView = [tableView viewAtColumn:0 row:tableView.selectedRow makeIfNecessary:NO];
    contentView.label.wantsLayer = YES;
    contentView.label.textColor = [NSColor blueColor];
}

@end














































