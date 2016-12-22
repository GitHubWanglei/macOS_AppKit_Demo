//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"

@interface ViewController ()<NSOutlineViewDelegate, NSOutlineViewDataSource>

@property (strong) IBOutlet NSOutlineView *OutlineView;
@property (nonatomic, strong) Node *outLineNode;
@property (strong) IBOutlet NSTextField *nodeNameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.OutlineView.delegate = self;
    self.OutlineView.dataSource = self;
    
    [self.OutlineView expandItem:nil expandChildren:YES];//展开所有节点
}

#pragma mark - IBAcitons
//添加节点
- (IBAction)addNodeAction:(NSButton *)sender {
    
    NSString *newNodeName = [self newNodeName];
    if (newNodeName.length == 0) {
        return;
    }
    Node *newNode = [[Node alloc] init];
    newNode.title = newNodeName;
    
    if (self.outLineNode.childNodes.count == 0) {//没有根节点
        self.outLineNode = [[Node alloc] init];
        self.outLineNode.childNodes = [NSMutableArray arrayWithObjects:newNode, nil];
        [self.OutlineView reloadData];
    }else{
        if (self.OutlineView.selectedRow < 0) {
            return;
        }
        Node *selectedNode = [self.OutlineView itemAtRow:self.OutlineView.selectedRow];
        BOOL needExpand;//是否需要展开
        if ([self.OutlineView isItemExpanded:selectedNode]) {//已经展开
            needExpand = NO;
        }else{//没有展开
            needExpand = YES;
            for (Node *childNode in selectedNode.childNodes) {
                if (childNode.childNodes.count > 0) {
                    needExpand = NO;
                }
            }
        }
        NSMutableArray<Node *> *childNodes = (selectedNode.childNodes.count > 0) ? selectedNode.childNodes : [NSMutableArray array];
        [childNodes addObject:newNode];
        selectedNode.childNodes = childNodes;
        
        [self.OutlineView reloadData];
        [self.OutlineView expandItem:selectedNode expandChildren:needExpand];//展开
    }
}
//删除节点
- (IBAction)removeNodeAction:(NSButton *)sender {
    if (self.OutlineView.selectedRow < 0) {
        return;
    }
    Node *selectedNode = [self.OutlineView itemAtRow:self.OutlineView.selectedRow];
    Node *parentNode = [self.OutlineView parentForItem:selectedNode];
    if (parentNode == nil) {//选中的是根节点
        self.outLineNode = [[Node alloc] init];
    }else{
        [parentNode.childNodes removeObject:selectedNode];
    }
    
    [self.OutlineView reloadData];
}

- (NSString *)newNodeName {
    return [self.nodeNameLabel.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - NSOutlineViewDataSource
//每个 item 有多少个子节点
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (!item) {
        return self.outLineNode.childNodes.count;
    }else{
        Node *node = item;
        return node.childNodes.count;
    }
}
//每个节点对应的数据
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (!item) {
        return self.outLineNode.childNodes[index];
    }else{
        Node *node = item;
        return node.childNodes[index];
    }
}
//节点是否可以展开
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if (!item) {
        return self.outLineNode.childNodes.count > 0;
    }else{
        Node *node = item;
        return node.childNodes.count > 0;
    }
}

#pragma mark - NSOutlineViewDelegate
//根据节点对应的 view 视图
- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    NSView *view = [outlineView makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSImageView *imageView = view.subviews[0];
    NSTextField *textField = view.subviews[1];
    Node *node = item;
    NSString *imageName = (node.childNodes.count > 0) ? NSImageNameFolder : NSImageNameListViewTemplate;
    imageView.image = [NSImage imageNamed:imageName];
    textField.stringValue = node.title;
    return view;
}

#pragma mark - Regular Delegate Methods
//选中节点的回调方法
- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    NSOutlineView *outlineView = notification.object;
    NSInteger selectedRowIndex = outlineView.selectedRow;
    Node *node = [outlineView itemAtRow:selectedRowIndex];
    NSLog(@"------selected node: %@", node.title);
}

#pragma mark - Lazy load

- (Node *)outLineNode {
    if (!_outLineNode) {
        _outLineNode = [[Node alloc] init];
        //第 1 级节点
        Node *rootNode = [[Node alloc] init];
        rootNode.title = @"公司";
        _outLineNode.childNodes = [NSMutableArray array];
        [_outLineNode.childNodes addObject:rootNode];
        //第 2 级节点
        Node *node_1_1 = [[Node alloc] init];
        node_1_1.title = @"电商";
        Node *node_1_2 = [[Node alloc] init];
        node_1_2.title = @"游戏";
        Node *node_1_3 = [[Node alloc] init];
        node_1_3.title = @"音乐";
        rootNode.childNodes = [NSMutableArray array];
        [rootNode.childNodes addObject:node_1_1];
        [rootNode.childNodes addObject:node_1_2];
        [rootNode.childNodes addObject:node_1_3];
        //第 3 级节点
        Node *node_2_1 = [[Node alloc] init];
        node_2_1.title = @"研发";
        Node *node_2_2 = [[Node alloc] init];
        node_2_2.title = @"运营";
        node_1_1.childNodes = [NSMutableArray array];
        [node_1_1.childNodes addObject:node_2_1];
        [node_1_1.childNodes addObject:node_2_2];
    }
    return _outLineNode;
}


@end
