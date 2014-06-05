//
//  AppDelegate.m
//  CloseBrowserToContinue
//
//  Created by shenyixin on 14-6-5.
//  Copyright (c) 2014年 shenyixin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.installExtensionWndCtrl = [[[InstallExtensionWndCtrl alloc] init] autorelease];
    [self.installExtensionWndCtrl showWindow:self];

}


@end
