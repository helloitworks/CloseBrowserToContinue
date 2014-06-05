//
//  AppDelegate.h
//  CloseBrowserToContinue
//
//  Created by shenyixin on 14-6-5.
//  Copyright (c) 2014年 shenyixin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InstallExtensionWndCtrl.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (retain)  InstallExtensionWndCtrl *installExtensionWndCtrl;


@end
