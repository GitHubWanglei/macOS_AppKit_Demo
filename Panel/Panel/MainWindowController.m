//
//  MainWindowController.m
//  Panel
//
//  Created by lihongfeng on 16/12/9.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@property (strong) IBOutlet NSPanel *LoginPanel;
@property (strong) IBOutlet NSButton *loginButton;
@property (strong) IBOutlet NSTextField *textView;

@property (strong) IBOutlet NSTextField *userName;
@property (strong) IBOutlet NSTextField *password;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.textView.font = [NSFont userFontOfSize:20];
}

//登录 panel
- (IBAction)loginAction:(NSButton *)sender {
    [self.window beginSheet:self.LoginPanel completionHandler:^(NSModalResponse returnCode) {
        //completionHandler
    }];
}

- (IBAction)endLogin:(id)sender {
    [self.window endSheet:self.LoginPanel];
    NSString *result = [NSString stringWithFormat:@"user name: %@ \npassword: %@", self.userName.stringValue, self.password.stringValue];
    self.textView.stringValue = result;
}

//打开文件: NSOpenPanel
- (IBAction)openFile:(NSButton *)sender {
    
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = YES;
    openPanel.canChooseDirectories = YES;
    openPanel.allowsMultipleSelection = YES;
    openPanel.allowedFileTypes = @[@"txt"];
    
    //直接显示
//    [openPanel beginWithCompletionHandler:^(NSInteger result) {
//        if (result == NSFileHandlingPanelOKButton) {
//            NSString *result = @"";
//            NSArray *fileURLs = [openPanel URLs];
//            for (NSURL *url in fileURLs) {
//                NSError *error;
//                NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//                if (error) {
//                    continue;
//                }
//                result = [result stringByAppendingFormat:@"\n%@", string];
//            }
//            self.textView.stringValue = result;
//        }
//    }];
    
    //模态展示
    if ([openPanel runModal] == 1) {
        NSLog(@"确定");
        NSString *result = @"";
        NSArray *fileURLs = [openPanel URLs];
        for (NSURL *url in fileURLs) {
            NSError *error;
            NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
            if (error) {
                continue;
            }
            result = [result stringByAppendingFormat:@"\n%@", string];
        }
        self.textView.stringValue = result;
    }else{
        NSLog(@"取消");
    }
    
}

//保存文件: NSSavePanel
- (IBAction)saveTextToFile:(NSButton *)sender {
    NSString *resultString = [self.textView.stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (resultString.length == 0) {
        NSLog(@"没有内容!");
        [self showAlert];
        return;
    }
    
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    savePanel.title = @"保存文件";
    savePanel.message = @"保存您的文件.";
    savePanel.allowedFileTypes = @[@"txt"];
    savePanel.nameFieldStringValue = @"fileName";
    
    //直接显示
//    [savePanel beginWithCompletionHandler:^(NSInteger result) {
//        if (result == NSFileHandlingPanelOKButton) {
//            NSString *path = [savePanel URL].path;
//            NSLog(@"filePath: %@", path);
//            NSError *error;
//            [resultString writeToURL:[savePanel URL] atomically:YES encoding:NSUTF8StringEncoding error:&error];
//            if (error) {
//                NSLog(@"保存失败!");
//            }
//        }
//    }];
    
    //模态显示
    if ([savePanel runModal] == 1) {
        NSLog(@"确定");
        NSString *path = [savePanel URL].path;
        NSLog(@"filePath: %@", path);
        NSError *error;
        [resultString writeToURL:[savePanel URL] atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"保存失败!");
        }
    }else{
        NSLog(@"取消");
    }
}

//颜色面板: NSColorPanel
- (IBAction)selectColor:(NSButton *)sender {
    NSColorPanel *colorPanel = [NSColorPanel sharedColorPanel];
    [colorPanel setTarget:self];
    [colorPanel setAction:@selector(changeColor:)];
    [colorPanel orderFront:nil];
}

- (void)changeColor:(id)sender{
    NSColorPanel *colorPanel = sender;
    NSColor *color = colorPanel.color;
    self.textView.textColor = color;
}

//字体面板: NSFontManager
- (IBAction)SelectFont:(NSButton *)sender {
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    [fontManager setTarget:self];
    [fontManager setAction:@selector(changeFont:)];
    [fontManager orderFrontFontPanel:self];
}

- (void)changeFont:(id)sender{
    NSFontManager *manager = sender;
    self.textView.font = [manager convertFont:self.textView.font];
}

- (NSString *)windowNibName{
    return @"MainWindowController";
}

//警告框:
- (void)showAlert {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"警告!";
    alert.informativeText = @"输入框不能为空.";
    [alert addButtonWithTitle:@"确定"];
    alert.alertStyle = NSAlertStyleInformational;
    [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
        ;
    }];
}

@end














