//
//  CYG_TableDelegateManager.h
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//cell
typedef __kindof UITableViewCell * (^CYGTableViewCellConfigureBlock)(UITableView *tableView, NSIndexPath *indexPath) ;
typedef CGFloat (^CYGTableViewCellHeightBlock)(UITableView *tableView, NSIndexPath *indexPath) ;
typedef void    (^CYGTableViewDidSelectCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef NSInteger (^CYGTableViewNumberOfSectionsBlock)(UITableView *tableView);
typedef NSInteger (^CYGTableViewNumberOfRowsInSectionBlock)(UITableView *tableView, NSInteger section);

//Header
typedef __kindof UITableViewHeaderFooterView * (^CYGTableViewSectionHeaderBlock)(UITableView *tableView, NSInteger section);
typedef CGFloat (^CYGTableViewSectionHeaderHeightBlock)(UITableView *tableView, NSInteger section);

//Footer
typedef __kindof UITableViewHeaderFooterView * (^CYGTableViewSectionFooterBlock)(UITableView *tableView, NSInteger section);
typedef CGFloat (^CYGTableViewSectionFooterHeightBlock)(UITableView *tableView, NSInteger section);

@interface CYG_TableDelegateManager : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) CYGTableViewCellConfigureBlock cellConfigBlock;
@property (nonatomic, copy) CYGTableViewNumberOfSectionsBlock numberOfSectionsBlock;
@property (nonatomic, copy) CYGTableViewNumberOfRowsInSectionBlock numberOfRowsInSectionBlock;
@property (nonatomic, copy) CYGTableViewCellHeightBlock cellHeightBlock;
@property (nonatomic, copy) CYGTableViewDidSelectCellBlock didSelectedBlock;
//header
@property (nonatomic, copy) CYGTableViewSectionHeaderBlock sectionHeaderBlock;
@property (nonatomic, copy) CYGTableViewSectionHeaderHeightBlock sectionHeaderHeightBlock;

//footer
@property (nonatomic, copy) CYGTableViewSectionFooterBlock sectionFooterBlock;
@property (nonatomic, copy) CYGTableViewSectionFooterHeightBlock sectionFooterHeightBlock;
@end
