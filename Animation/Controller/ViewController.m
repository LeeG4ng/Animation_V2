//
//  ViewController.m
//  Animation
//
//  Created by Gary Lee on 2017/11/6.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ViewController.h"
#import "CollectionViewCell.h"
#import "TableViewController.h"
#import "Animation+CoreDataClass.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *animationArr;
@property (nonatomic, strong) Animation *animation;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"番剧";
    UIBarButtonItem *tableBtn = [[UIBarButtonItem alloc] initWithTitle:@"追番" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBtn)];
    self.navigationItem.rightBarButtonItem = tableBtn;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animation"];
    NSError *error = nil;
    
    NSArray *animationArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    _animationArr = [NSMutableArray arrayWithArray:animationArray];
[_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.animationArr.count;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width-50)/3, (self.view.frame.size.width-50)/2);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    self.animation = [self.animationArr objectAtIndex:indexPath.row];
    cell.cellName.text = self.animation.name;
    cell.cellTime.text = [NSString stringWithFormat:@"上映于%@", self.animation.time];
    cell.cellNumber.text = [NSString stringWithFormat:@"共%@集",self.animation.number];
    cell.cellImage.image = [UIImage imageWithData:self.animation.image];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewCtrl animated:YES];
    detailViewCtrl.delegate = self;
    detailViewCtrl.animation = [self.animationArr objectAtIndex:indexPath.row];
    self.indexPath = indexPath;
}


////设置每个item水平间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 10;
//}
//
////设置每个item垂直间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 15;
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 10, 0, 10);//（上、左、下、右）
}


- (void)didClickBtn {
    TableViewController *tableViewCtrl = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableViewCtrl animated:YES];
//    tableViewCtrl.addViewCtrl.delegate = self;
}

- (NSMutableArray *)animationArr {
    if(_animationArr == nil) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animation"];
        NSError *error = nil;
        
        NSArray *animationArray = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
        _animationArr = [NSMutableArray arrayWithArray:animationArray];
    }
    return _animationArr;
}

- (Animation *)animation {
    if(_animation == nil) {
        _animation = [[Animation alloc] init];
    }
    return _animation;
}

//- (void)didClickDelete {
//    [_collectionView performBatchUpdates:^{
//        [_animationArr removeObjectAtIndex:_indexPath.row];
//        [_collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:_indexPath]];
//        
//    } completion:^(BOOL finished) {
//        [_collectionView reloadData];
//    }];
//}

//- (void)didClickSave {
//    [_collectionView performBatchUpdates:^{
//        //        [_animationArr removeObjectAtIndex:_indexPath.row];
//        [_collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
//        
//    } completion:^(BOOL finished) {
//        [_collectionView reloadInputViews];
//    }];
//}

@end
