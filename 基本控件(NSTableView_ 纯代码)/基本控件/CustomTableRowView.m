//
//  CustomTableRowView.m
//  基本控件
//
//  Created by lihongfeng on 16/12/15.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "CustomTableRowView.h"

@implementation CustomTableRowView

// 自定义 row 被选中的背景色
-(void)drawSelectionInRect:(NSRect)dirtyRect {
    if (self.selectionHighlightStyle != NSTableViewSelectionHighlightStyleNone) {
        [[NSColor lightGrayColor] setFill];
        NSBezierPath *path = [NSBezierPath bezierPathWithRect:NSInsetRect(self.bounds, 0, 0)];
        [path fill];
        [path stroke];
    }
}

//自定义 row 背景色
- (void)setBackgroundColor:(NSColor *)backgroundColor {
    super.backgroundColor = [NSColor whiteColor];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
