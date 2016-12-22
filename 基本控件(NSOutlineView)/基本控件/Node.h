//
//  Node.h
//  基本控件
//
//  Created by lihongfeng on 16/12/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray<Node *> *childNodes;

@end
