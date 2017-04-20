//
//  ViewController.m
//  TableAndCollectDelegateManager
//
//  Created by cyg on 2017/4/19.
//  Copyright © 2017年 cyg. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+CYGDelegateManager.h"
#import "UICollectionView+CYGDelegateManager.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end


static NSString *tableViewcellID = @"tableViewcellID";
static NSString *collectionViewCellId =@"collectionViewCellId";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initUI
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:tableViewcellID];
    [self.view addSubview:self.tableView];
    [self.tableView configCellWith:^__kindof UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewcellID];
        cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row+1];
        return cell;
    } cellHeigth:^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 44;
    } numberOfSection:^NSInteger(UITableView *tableView) {
        return 1;
    } numberOfRowsInSection:^NSInteger(UITableView *tableView, NSInteger section) {
        return 8;
    } didSelected:^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"点击了第%ld个cell",indexPath.row+1);
    }];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT-300) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellId];
    [self.view addSubview:self.collectionView];
    [self.collectionView configCellWith:^__kindof UICollectionViewCell *(UICollectionView *collectionView, NSIndexPath *indexPath) {
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
        UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        label.backgroundColor = [UIColor whiteColor];
        [cell addSubview:label];
        label.text= [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row+1];
        return cell;
    } cellSize:^CGSize(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath) {
        return CGSizeMake((SCREEN_WIDTH-30)/3, 100);
    } numberOfSection:^NSInteger(UICollectionView *collectionView) {
        return 1;
    } numberOfItemsInSection:^NSInteger(UICollectionView *collectionView, NSInteger section) {
        return 10;
    } didSelected:^(UICollectionView *collectionView, NSIndexPath *indexPath) {
        
    }];
    [self.collectionView configCellLayoutWithMinimumInteritemSpacing:^CGFloat(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        return 10;
    } minimumLineSpacing:^CGFloat(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        return 10;
    } insetForSection:^UIEdgeInsets(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section) {
        return UIEdgeInsetsMake(10, 0, 10, 0);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
