//
//  UITableView+CYGDelegateManager.h
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYG_TableDelegateManager.h"
@interface UITableView (CYGDelegateManager)
@property (nonatomic, strong) CYG_TableDelegateManager *separationManager;
- (void)configCellWith:(CYGTableViewCellConfigureBlock)cellConfig
            cellHeigth:(CYGTableViewCellHeightBlock)cellHeight
       numberOfSection:(CYGTableViewNumberOfSectionsBlock)numberOfSection
 numberOfRowsInSection:(CYGTableViewNumberOfRowsInSectionBlock)numberOfRowsInSection
           didSelected:(CYGTableViewDidSelectCellBlock)didSelected;

- (void)configSectionHeaderWith:(CYGTableViewSectionHeaderBlock)sectionHeader
            sectionHeaderHeight:(CYGTableViewSectionHeaderHeightBlock)sectionHeaderHeight;

- (void)configSectionFooterWith:(CYGTableViewSectionFooterBlock)sectionFooter
            sectionFooterHeight:(CYGTableViewSectionFooterHeightBlock)sectionFooterHeight;
@end
