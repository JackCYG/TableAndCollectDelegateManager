//
//  UICollectionView+CYGDelegateManager.m
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import "UICollectionView+CYGDelegateManager.h"
#import <objc/runtime.h>
@implementation UICollectionView (CYGDelegateManager)
- (void)configCellWith:(CYGCollectionViewCellConfigureBlock)cellConfig
              cellSize:(CYGCollectionViewCellSizeBlock)cellSize numberOfSection:(CYGCollectionViewNumberOfSectionsBlock)numberOfSection
numberOfItemsInSection:(CYGCollectionViewNumberOfItemsInSectionBlock)numberOfRowsInSection
           didSelected:(CYGCollectionViewDidSelectCellBlock)didSelected
{
    CYG_CollectionDelegateManager *manager = self.separationManager;
    manager.cellConfigBlock = cellConfig;
    manager.cellSizeBlock = cellSize;
    manager.numberOfSectionsBlock = numberOfSection;
    manager.numberOfItemsInSectionBlock = numberOfRowsInSection;
    manager.didSelectedBlock = didSelected;
}

- (void)configSectionHeaderWith:(CYGCollectionViewSectionHeaderBlock)sectionHeader sectionHeaderSize:(CYGCollectionViewSectionHeaderSizeBlock)sectionHeaderSize
{
    CYG_CollectionDelegateManager *manager = self.separationManager;
    manager.sectionHeaderBlock = sectionHeader;
    manager.sectionHeaderSizeBlock = sectionHeaderSize;
}
- (void)configCellLayoutWithMinimumInteritemSpacing:(CYGCollectionViewMinimumInteritemSpacingBlock)minimumInteritemSpacing minimumLineSpacing:(CYGCollectionViewMinimumLineSpacingBlock)minimumLineSpacing insetForSection:(CYGCollectionViewInsetForSection)insetForSection
{
    CYG_CollectionDelegateManager *manager = self.separationManager;
    manager.minimumInteritemSpacingBlock = minimumInteritemSpacing;
    manager.minimumLineSpacingBlock = minimumLineSpacing;
    manager.insetForSectionBlock = insetForSection;
}
- (void)configSectionFooterWith:(CYGCollectionViewSectionFooterBlock)sectionFooter sectionFooterSize:(CYGCollectionViewSectionFooterSizeBlock)sectionFooterSize
{
    CYG_CollectionDelegateManager *manager = self.separationManager;
    manager.sectionFooterBlock = sectionFooter;
    manager.sectionFooterSizeBlock = sectionFooterSize;
}
#pragma mark - ========= Setter & Getter =========
- (void)setSeparationManager:(CYG_CollectionDelegateManager *)separationManager
{
    objc_setAssociatedObject(self, @selector(separationManager), separationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CYG_CollectionDelegateManager *)separationManager
{
    if (objc_getAssociatedObject(self, @selector(separationManager)) == nil) {
        
        CYG_CollectionDelegateManager * manager = [[CYG_CollectionDelegateManager alloc] init];
        self.delegate = manager;
        self.dataSource = manager;
        [self setSeparationManager:manager];
        
    }
    return objc_getAssociatedObject(self, @selector(separationManager));
}

@end
