//
//  CustomCollectionViewItem.h
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomCollectionViewItem : NSCollectionViewItem

- (void)itemClickHandler:(void (^)(NSString *title))clickHandler;

@end
