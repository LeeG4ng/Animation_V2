//
//  TableViewController.m
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "TableViewController.h"
#import "AddViewController.h"
#import "TableViewCell.h"
#import "Animation+CoreDataClass.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "DetailViewController.h"


@interface TableViewController () <UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *animationArr;
@property (nonatomic, strong) NSArray *filteredAnimationArr;
@property (nonatomic, strong) Animation *animation;
@property UISearchController *searchCtrl;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"追番";
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"新增" style:UIBarButtonItemStylePlain target:self action:@selector(didClickAdd)];
    self.navigationItem.rightBarButtonItem = addBtn;
    self.searchCtrl = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchCtrl.searchResultsUpdater = self;
    self.searchCtrl.dimsBackgroundDuringPresentation = NO;
    [self.searchCtrl.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchCtrl.searchBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animation"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"follow == YES"];
    request.predicate = predicate;
    NSError *error = nil;
    self.animationArr = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(!self.searchCtrl.active)
        return self.animationArr.count;
    else
        return self.filteredAnimationArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    if(!self.searchCtrl.active) {
        self.animation = [self.animationArr objectAtIndex:indexPath.row];
        cell.cellName.text = self.animation.name;
        cell.cellTime.text = [NSString stringWithFormat:@"上映于%@", self.animation.time];
        cell.cellNumber.text = [NSString stringWithFormat:@"共%@集",self.animation.number];
        cell.cellImage.image = [UIImage imageWithData:self.animation.image];
    }
    else {
        self.animation = [self.filteredAnimationArr objectAtIndex:indexPath.row];
        cell.cellName.text = self.animation.name;
        cell.cellTime.text = [NSString stringWithFormat:@"上映于%@", self.animation.time];
        cell.cellNumber.text = [NSString stringWithFormat:@"共%@集",self.animation.number];
        cell.cellImage.image = [UIImage imageWithData:self.animation.image];
    }
    NSLog(@"%d",self.animation.follow);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewCtrl animated:YES];
    detailViewCtrl.animation = [self.animationArr objectAtIndex:indexPath.row];
}

- (void)didClickAdd {
    self.addViewCtrl = [[AddViewController alloc] init];
    [self.navigationController pushViewController:self.addViewCtrl animated:YES];
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

//- (NSArray *)animationArr {
//    if(_animationArr == nil) {
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animation"];
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"like == %@",@YES];
//        request.predicate = predicate;
//        NSError *error = nil;
//        _animationArr = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
//    }
//    return _animationArr;
//}

- (Animation *)animation {
    if(_animation == nil) {
        _animation = [[Animation alloc] init];
    }
    return _animation;
}

#pragma mark - searchController delegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = [self.searchCtrl.searchBar text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@ || time CONTAINS[c] %@ || number CONTAINS[c] %@ || country CONTAINS[c] %@ || intro CONTAINS[c] %@", searchString, searchString, searchString, searchString, searchString];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animation"];
    request.predicate = predicate;
    NSError *error = nil;
    self.filteredAnimationArr = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    [self.tableView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
