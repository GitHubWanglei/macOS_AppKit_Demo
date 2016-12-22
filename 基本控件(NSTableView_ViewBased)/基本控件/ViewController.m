//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/14.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSTableViewDelegate, NSTableViewDataSource, NSMenuDelegate>

@property (strong) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (strong) IBOutlet NSMenu *tableViewMenu;

@property (nonatomic, assign) NSInteger clickedRow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    self.tableViewMenu.delegate = self;
    self.tableView.menu = self.tableViewMenu;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.doubleAction = @selector(doubleClickAction:);
    self.tableView.allowsMultipleSelection = NO;
    
    NSTableColumn *column = self.tableView.tableColumns[0];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:column.identifier ascending:YES];
    column.sortDescriptorPrototype = descriptor;
    
}

- (void)doubleClickAction:(id)sender {
    NSLog(@"doubleClickAction.");
}

//是否可以多选
- (IBAction)multipleSelectionEnableAction:(id)sender {
    NSButton *button = sender;
    self.tableView.allowsMultipleSelection = button.state;
}

//添加
- (IBAction)addRow:(NSButton *)sender {
    NSDictionary *dic = @{@"name": [NSString stringWithFormat:@"name %u", arc4random() % 100],
                          @"address": @"USA",
                          @"gender": @"Male",
                          @"married": @"0"};
    [self.dataSource addObject:dic];
    [self.tableView reloadData];
    [self.tableView editColumn:0 row:self.dataSource.count - 1 withEvent:nil select:YES];
}

//删除
- (IBAction)removeRow:(NSButton *)sender {
    NSInteger row = self.tableView.selectedRow;
    if (row < 0) {
        return;
    }
    if (self.tableView.allowsMultipleSelection == YES) {
        [self deleteRows:self.tableView.selectedRowIndexes];
    }else{
        [self deleteRow:_clickedRow];
    }
}

//删除一行
- (void)deleteRow:(NSInteger)row {
    [self.tableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:row] withAnimation:NSTableViewAnimationEffectFade];
    [self.dataSource removeObjectAtIndex:row];
}

//删除多行
- (void)deleteRows:(NSIndexSet *)rows {
    [self.tableView beginUpdates];
    [self.tableView removeRowsAtIndexes:rows withAnimation:NSTableViewAnimationEffectFade];
    [self.tableView endUpdates];
    //更新数据源
    [self.dataSource removeObjectsAtIndexes:rows];
    //    [self.tableView reloadData];
}

- (void)initData{
    self.dataSource = [NSMutableArray arrayWithArray:@[@{@"name": @"John", @"address": @"USA", @"gender": @"Male", @"married": @"0"},
                                                       @{@"name": @"Mary", @"address": @"China", @"gender": @"Female", @"married": @"1"},
                                                       @{@"name": @"Jack", @"address": @"Japan", @"gender": @"Male", @"married": @"0"},
                                                       @{@"name": @"Tom", @"address": @"Russia", @"gender": @"Male", @"married": @"1"}]];
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn {
    NSLog(@"点击了 %@ 列.", tableColumn.title);
    NSLog(@"-------- %d", tableColumn.sortDescriptorPrototype.ascending);
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.dataSource.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *rowInfoDic = self.dataSource[row];
    NSString *key = tableColumn.identifier;
    NSString *value = rowInfoDic[key];
    
    NSView *contentView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if ([key isEqualToString:@"name"] || [key isEqualToString:@"address"]) {
        NSTextField *textField = [contentView subviews][0];
        textField.stringValue = value;
    }else if ([key isEqualToString:@"gender"]){
        NSComboBox *comboBox = [contentView subviews][0];
        comboBox.stringValue = value;
    }else{
        NSButton *checkBoxButton = [contentView subviews][0];
        checkBoxButton.state = [value boolValue];
    }
    
    return contentView;
}

#pragma mark ***** Notifications *****
//鼠标左键选中调用
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = [notification.object selectedRow];
    NSLog(@"------ selected row %ld", row);
    _clickedRow = row;
}

#pragma mark - NSMenuDelegate
//鼠标右键选中调用
- (void)menuNeedsUpdate:(NSMenu *)menu {
    NSInteger clickedRow = [self.tableView clickedRow];
    NSInteger clickedColumn = [self.tableView clickedColumn];
    NSLog(@"click row: %ld, column: %ld", clickedRow, clickedColumn);
    _clickedRow = clickedRow;
}

#pragma mark - Menu actions

- (IBAction)item1Action:(id)sender {
    NSLog(@"click item 1.");
}
- (IBAction)item3Action:(id)sender {
    NSLog(@"click item 3.");
    
    if (self.tableView.allowsMultipleSelection == YES) {
        [self deleteRows:self.tableView.selectedRowIndexes];
    }else{
        [self deleteRow:_clickedRow];
    }
}

@end







