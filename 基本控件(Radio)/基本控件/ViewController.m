//
//  ViewController.m
//  基本控件
//
//  Created by lihongfeng on 16/12/12.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong) IBOutlet NSButton *radio1;
@property (strong) IBOutlet NSButton *radio2;
@property (strong) IBOutlet NSButton *radio3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)radioAction:(NSButton *)sender {
    self.radio1.state = 0;
    self.radio2.state = 0;
    self.radio3.state = 0;
    NSButton *radio = sender;
    radio.state = !radio.state;
}


@end
