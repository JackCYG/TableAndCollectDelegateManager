//
//  CYG_CollectionDelegateManager.m
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import "CYG_CollectionDelegateManager.h"

@implementation CYG_CollectionDelegateManager
#pragma mark - ========= CollectionView Cell =========
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (self.cellConfigBlock) {
        return self.cellConfigBlock(collectionView, indexPath);
    }
    else
    {
        NSAssert(0, @"缺少cellConfigBlock");
    }
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellSizeBlock) {
        return self.cellSizeBlock(collectionView, collectionViewLayout, indexPath);
    }
    else
    {
        NSAssert(0, @"缺少cellSizeBlock");
    }
    return CGSizeZero;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.numberOfSectionsBlock) {
        return self.numberOfSectionsBlock(collectionView);
    }
    else
    {
        NSAssert(0, @"缺少numberOfSectionsBlock");
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (self.numberOfItemsInSectionBlock) {
        return self.numberOfItemsInSectionBlock(collectionView, section);
    }
    else
    {
        NSAssert(0, @"缺少numberOfItemsInSectionBlock");
    }
    return 0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectedBlock) {
        self.didSelectedBlock(collectionView, indexPath);
    }
}
//cell layout
//全部0间距

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.minimumInteritemSpacingBlock) {
        return  self.minimumInteritemSpacingBlock(collectionView, collectionViewLayout, section);
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.minimumLineSpacingBlock) {
        return self.minimumLineSpacingBlock(collectionView, collectionViewLayout, section);
    }
    return 0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.insetForSectionBlock) {
        return self.insetForSectionBlock(collectionView, collectionViewLayout, section);
    }
    return UIEdgeInsetsZero;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.sectionHeaderBlock && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return self.sectionHeaderBlock(collectionView, kind, indexPath);
    }
    else if (self.sectionFooterBlock && [kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        return self.sectionFooterBlock(collectionView, kind, indexPath);
    }
    
    
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.sectionHeaderSizeBlock) {
        return self.sectionHeaderSizeBlock(collectionView, collectionViewLayout, section);
    }
    
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (self.sectionFooterSizeBlock) {
        return self.sectionFooterSizeBlock(collectionView, collectionViewLayout, section);
    }
    
    return CGSizeZero;
}
@end
