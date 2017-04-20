//
//  CYG_CollectionDelegateManager.h
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//cell
typedef __kindof UICollectionViewCell * (^CYGCollectionViewCellConfigureBlock)(UICollectionView *collectionView, NSIndexPath *indexPath) ;
typedef CGSize (^CYGCollectionViewCellSizeBlock)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath);
typedef void    (^CYGCollectionViewDidSelectCellBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);
typedef NSInteger (^CYGCollectionViewNumberOfSectionsBlock)(UICollectionView *collectionView);
typedef NSInteger (^CYGCollectionViewNumberOfItemsInSectionBlock)(UICollectionView *collectionView, NSInteger section);

//cellLayout
typedef CGFloat (^CYGCollectionViewMinimumInteritemSpacingBlock)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef CGFloat (^CYGCollectionViewMinimumLineSpacingBlock)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);
typedef UIEdgeInsets (^CYGCollectionViewInsetForSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);

//Header
typedef __kindof UICollectionReusableView * (^CYGCollectionViewSectionHeaderBlock)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath);
typedef CGSize (^CYGCollectionViewSectionHeaderSizeBlock)(UICollectionView *collectionView, UICollectionViewLayout*collectionViewLayout, NSInteger section);

//Footer
typedef __kindof UICollectionReusableView * (^CYGCollectionViewSectionFooterBlock)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath);
typedef CGSize (^CYGCollectionViewSectionFooterSizeBlock)(UICollectionView *collectionView, UICollectionViewLayout*collectionViewLayout, NSInteger section);
@interface CYG_CollectionDelegateManager : NSObject<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, copy) CYGCollectionViewCellConfigureBlock cellConfigBlock;
@property (nonatomic, copy) CYGCollectionViewNumberOfSectionsBlock numberOfSectionsBlock;
@property (nonatomic, copy) CYGCollectionViewNumberOfItemsInSectionBlock numberOfItemsInSectionBlock;
@property (nonatomic, copy) CYGCollectionViewCellSizeBlock cellSizeBlock;
@property (nonatomic, copy) CYGCollectionViewDidSelectCellBlock didSelectedBlock;

//cellLayout
@property (nonatomic, copy) CYGCollectionViewMinimumInteritemSpacingBlock minimumInteritemSpacingBlock;
@property (nonatomic, copy) CYGCollectionViewMinimumLineSpacingBlock minimumLineSpacingBlock;
@property (nonatomic, copy) CYGCollectionViewInsetForSection insetForSectionBlock;


//header
@property (nonatomic, copy) CYGCollectionViewSectionHeaderBlock sectionHeaderBlock;
@property (nonatomic, copy) CYGCollectionViewSectionHeaderSizeBlock sectionHeaderSizeBlock;

//footer
@property (nonatomic, copy) CYGCollectionViewSectionFooterBlock sectionFooterBlock;
@property (nonatomic, copy) CYGCollectionViewSectionFooterSizeBlock sectionFooterSizeBlock;


@end
