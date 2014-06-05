//
//  InstallExtensionWndCtrl.m
//  CloseBrowserToContinue
//
//  Created by shenyixin on 14-6-5.
//  Copyright (c) 2014年 shenyixin. All rights reserved.
//

#import "InstallExtensionWndCtrl.h"

NSString *const TableViewColumnAppName = @"name";

const CGFloat kTableRowHeight = 48.f;


@implementation TableItem
@synthesize name = _name;
@synthesize iconName = _iconName;

-(void)dealloc
{
    self.name = nil;
    self.iconName = nil;
    [super dealloc];
}

@end


@interface InstallExtensionWndCtrl ()

@end

@implementation InstallExtensionWndCtrl
@synthesize contents = _contents;
@synthesize tableContents = _tableContents;
@synthesize tableView = _tableView;
@synthesize scrollView = _scrollView;
@synthesize scrollViewHeightConstraint = _scrollViewHeightConstraint;
@synthesize popUpButton = _popUpButton;

- (id)init
{
    self = [super initWithWindowNibName:@"InstallExtension"];
    if (self) {
        _contents = [[NSMutableArray alloc] init];
        TableItem *item = [[[TableItem alloc] init] autorelease];
        item.name = @"safari";
        item.iconName = @"safari";
        [_contents addObject:item];
        
        item = [[[TableItem alloc] init] autorelease];
        item.name = @"chrome";
        item.iconName = @"chrome";
        [_contents addObject:item];
        
        
        item = [[[TableItem alloc] init] autorelease];
        item.name = @"firefox";
        item.iconName = @"firefox";
        [_contents addObject:item];

        _tableContents = [_contents mutableCopy];
    }
    return self;
}

- (IBAction)popUpButtonAction:(id)sender
{
    NSString *title = [sender titleOfSelectedItem];
    
    [self.tableContents removeAllObjects];

    if ([title isEqualToString:@"显示一个程序"])
    {
        [self.tableContents addObject:[self.contents objectAtIndex:0]];

    }
    else if ([title isEqualToString:@"显示两个程序"])
    {
        [self.tableContents addObject:[self.contents objectAtIndex:0]];
        [self.tableContents addObject:[self.contents objectAtIndex:1]];
    }
    if ([title isEqualToString:@"显示三个程序"])
    {
        [self.tableContents addObject:[self.contents objectAtIndex:0]];
        [self.tableContents addObject:[self.contents objectAtIndex:1]];
        [self.tableContents addObject:[self.contents objectAtIndex:2]];
    }
    [self reloadData];

}


-(void)awakeFromNib
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.headerView = nil;
    [self.popUpButton selectItemAtIndex:self.tableContents.count-1];
    [self reloadData];

}

- (void)reloadData
{
    //可能因为行间隔，行高需要加上2，表格才不会有滚动？
    self.scrollViewHeightConstraint.constant = (kTableRowHeight + 2) * self.tableContents.count ;
    [self.tableView reloadData];
}


- (TableItem *)_entityForRow:(NSInteger)row {
    return (TableItem *)[self.tableContents objectAtIndex:row];
}


#pragma mark - tableview datasource
// The only essential/required tableview dataSource method
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.tableContents count];
}


#pragma mark - tableview delegate

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
	return kTableRowHeight;
}

// This method is optional if you use bindings to provide the data
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    TableItem *item = [self _entityForRow:row];
    NSString *identifier = [tableColumn identifier];
    
    if ([identifier isEqualToString:TableViewColumnAppName])
    {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
        cellView.textField.stringValue = item.name== nil ? @"nil": item.name ;
        cellView.imageView.image = [NSImage imageNamed:item.iconName];
        return cellView;
    }
    else
    {
        NSAssert1(NO, @"Unhandled table column identifier %@", identifier);
    }
    return nil;
}

//disable selection
- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex
{
    return NO;
}


@end
