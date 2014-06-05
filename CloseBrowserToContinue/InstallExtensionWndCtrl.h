//
//  InstallExtensionWndCtrl.h
//  CloseBrowserToContinue
//
//  Created by shenyixin on 14-6-5.
//  Copyright (c) 2014年 shenyixin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Some important info of app bundle
@interface TableItem : NSObject
{
    NSString* _name;
    NSString* _iconName;
}
@property(copy)NSString* name;
@property(copy)NSString* iconName;
@end





@interface InstallExtensionWndCtrl : NSWindowController <NSTableViewDataSource, NSTableViewDelegate>
{
    NSMutableArray *_contents;
    NSMutableArray *_tableContents;
    NSTableView *_tableView;
    
    NSScrollView *_scrollView;
    NSLayoutConstraint *_scrollViewHeightConstraint;
    
    NSPopUpButton *_popUpButton;
}

@property (retain) NSMutableArray *contents;

@property (retain) NSMutableArray *tableContents;
@property (retain) IBOutlet NSTableView *tableView;

@property (retain) IBOutlet NSScrollView *scrollView;

@property (retain) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;

@property (retain) IBOutlet NSPopUpButton *popUpButton;

- (IBAction)popUpButtonAction:(id)sender;

@end
