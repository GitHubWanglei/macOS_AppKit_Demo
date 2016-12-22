//
//  CustomTableCellView.m
//  基本控件
//
//  Created by lihongfeng on 16/12/19.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "CustomTableCellView.h"

@interface CustomTableCellView ()


@end

@implementation CustomTableCellView

- (void)setString:(NSString *)string {
    NSTextField *label = [[NSTextField alloc] initWithFrame:self.bounds];
    label.stringValue = string;
    label.editable = NO;
    label.bordered = NO;
    label.backgroundColor = [NSColor clearColor];
    [self addSubview:label];
}

- (void)setBackgroundStyle:(NSBackgroundStyle)backgroundStyle
{
    [super setBackgroundStyle:backgroundStyle];
//    if(backgroundStyle == NSBackgroundStyleDark){
        self.label.cell.backgroundStyle = NSBackgroundStyleLight;
//    }
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
