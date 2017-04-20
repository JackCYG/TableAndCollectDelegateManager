//
//  CYG_TableDelegateManager.m
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import "CYG_TableDelegateManager.h"

@implementation CYG_TableDelegateManager
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.cellConfigBlock) {
        
        UITableViewCell * cell = self.cellConfigBlock(tableView, indexPath);
        return cell;
    }
    else
    {
        NSAssert(0, @"缺少cellConfigBlock");
    }
    
    
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.numberOfSectionsBlock) {
        return self.numberOfSectionsBlock(tableView);
    }
    else
    {
        NSAssert(0, @"缺少numberOfSectionsBlock");
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.numberOfRowsInSectionBlock) {
        return self.numberOfRowsInSectionBlock(tableView, section);
    }
    else
    {
        NSAssert(0, @"缺少numberOfRowsInSectionBlock");
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeightBlock) {
        return self.cellHeightBlock(tableView, indexPath);
    }
    else
    {
        NSAssert(0, @"缺少cellHeightBlock");
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectedBlock) {
        self.didSelectedBlock(tableView, indexPath);
    }
    
}
#pragma mark - ========= TabelView HeaderView =========
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.sectionHeaderBlock) {
        
        UIView *view = self.sectionHeaderBlock(tableView, section);
        return view;
    }
    
    
    
    return nil;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.sectionHeaderHeightBlock) {
        return self.sectionHeaderHeightBlock(tableView, section);
    }
    return 0;
}


#pragma mark - ========= TabelView FooterView =========
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (self.sectionFooterBlock) {
        self.sectionFooterBlock(tableView, section);
    }
    
    return nil;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.sectionFooterHeightBlock) {
        return self.sectionFooterHeightBlock(tableView, section);
    }
    return 0;
}

@end
