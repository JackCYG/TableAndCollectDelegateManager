//
//  UITableView+CYGDelegateManager.m
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import "UITableView+CYGDelegateManager.h"
#import <objc/runtime.h>
@implementation UITableView (CYGDelegateManager)
- (void)configCellWith:(CYGTableViewCellConfigureBlock)cellConfig cellHeigth:(CYGTableViewCellHeightBlock)cellHeight
       numberOfSection:(CYGTableViewNumberOfSectionsBlock)numberOfSection
 numberOfRowsInSection:(CYGTableViewNumberOfRowsInSectionBlock)numberOfRowsInSection
           didSelected:(CYGTableViewDidSelectCellBlock)didSelected
{
    
    CYG_TableDelegateManager *manager = self.separationManager;
    manager.cellConfigBlock = cellConfig;
    manager.cellHeightBlock = cellHeight;
    manager.numberOfSectionsBlock = numberOfSection;
    manager.numberOfRowsInSectionBlock = numberOfRowsInSection;
    manager.didSelectedBlock = didSelected;
    
}
- (void)configSectionHeaderWith:(CYGTableViewSectionHeaderBlock)sectionHeader sectionHeaderHeight:(CYGTableViewSectionHeaderHeightBlock)sectionHeaderHeight
{
    CYG_TableDelegateManager *manager = self.separationManager;
    manager.sectionHeaderBlock = sectionHeader;
    manager.sectionHeaderHeightBlock= sectionHeaderHeight;
}

- (void)configSectionFooterWith:(CYGTableViewSectionFooterBlock)sectionFooter sectionFooterHeight:(CYGTableViewSectionFooterHeightBlock)sectionFooterHeight
{
    CYG_TableDelegateManager *manager = self.separationManager;
    manager.sectionFooterBlock = sectionFooter;
    manager.sectionFooterHeightBlock = sectionFooterHeight;
}

#pragma mark - ========= Setter & Getter =========
- (void)setSeparationManager:(CYG_TableDelegateManager *)separationManager
{
    objc_setAssociatedObject(self, @selector(separationManager), separationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CYG_TableDelegateManager *)separationManager
{
    if (objc_getAssociatedObject(self, @selector(separationManager)) == nil) {
        
        CYG_TableDelegateManager * manager = [[CYG_TableDelegateManager alloc] init];
        self.delegate = manager;
        self.dataSource = manager;
        [self setSeparationManager:manager];
        
    }
    return objc_getAssociatedObject(self, @selector(separationManager));
}
@end
