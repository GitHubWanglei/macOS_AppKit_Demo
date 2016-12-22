//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong) IBOutlet NSMenu *myMenu;
@property (strong) IBOutlet NSMenu *contextMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.menu = self.contextMenu; //设置上下文菜单
    
}

- (IBAction)popMenuAciton:(NSButton *)sender {
    NSPoint point = sender.frame.origin;
    point.x += 30;
    point.y -= 10;
    [self.myMenu popUpMenuPositioningItem:nil atLocation:point inView:self.view];
}

- (IBAction)item1Action:(id)sender {
    NSLog(@"----弹出式菜单: itme1");
}

- (IBAction)item2Action:(id)sender {
    NSLog(@"----弹出式菜单: itme2");
}

- (IBAction)item3Action:(id)sender {
    NSLog(@"----弹出式菜单: itme3");
}

- (IBAction)copyAction:(id)sender {
    NSLog(@"----上下文菜单: 复制");
}

- (IBAction)pasteAction:(id)sender {
    NSLog(@"----上下文菜单: 粘贴");
}

@end











