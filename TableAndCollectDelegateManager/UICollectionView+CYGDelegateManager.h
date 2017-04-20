//
//  UICollectionView+CYGDelegateManager.h
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYG_CollectionDelegateManager.h"
@interface UICollectionView (CYGDelegateManager)
@property (nonatomic, strong) CYG_CollectionDelegateManager *separationManager;
- (void)configCellWith:(CYGCollectionViewCellConfigureBlock)cellConfig
              cellSize:(CYGCollectionViewCellSizeBlock)cellSize
       numberOfSection:(CYGCollectionViewNumberOfSectionsBlock)numberOfSection
numberOfItemsInSection:(CYGCollectionViewNumberOfItemsInSectionBlock)numberOfRowsInSection
           didSelected:(CYGCollectionViewDidSelectCellBlock)didSelected;

- (void)configCellLayoutWithMinimumInteritemSpacing:(CYGCollectionViewMinimumInteritemSpacingBlock)minimumInteritemSpacing
                                 minimumLineSpacing:(CYGCollectionViewMinimumLineSpacingBlock)minimumLineSpacing
                                    insetForSection:(CYGCollectionViewInsetForSection)insetForSection;
- (void)configSectionHeaderWith:(CYGCollectionViewSectionHeaderBlock)sectionHeader
              sectionHeaderSize:(CYGCollectionViewSectionHeaderSizeBlock)sectionHeaderSize;

- (void)configSectionFooterWith:(CYGCollectionViewSectionFooterBlock)sectionFooter
              sectionFooterSize:(CYGCollectionViewSectionFooterSizeBlock)sectionFooterSize;
@end
