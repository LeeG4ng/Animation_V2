//
//  DetailViewController.m
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "DetailViewController.h"
#import "AddView.h"
#import "AppDelegate.h"

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AddView *addView;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.animation.name;
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    UIBarButtonItem *deteteBtn = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(didClickDelete)];
    NSArray *btnArr = [NSArray arrayWithObjects:saveBtn, deteteBtn, nil];
    self.navigationItem.rightBarButtonItems = btnArr;
    
    _addView = [[AddView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_addView];
    _addView.delegate = self;
    
    _addView.imageView.image = [UIImage imageWithData:self.animation.image];
    _addView.name.text = self.animation.name;
    _addView.time.text = self.animation.time;
    _addView.number.text = self.animation.number;
    _addView.country.text = self.animation.country;
    _addView.intro.text = self.animation.intro;
    _addView.like.on = self.animation.follow;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickSave {
    if([_addView.name.text isEqualToString:@""]||[_addView.time.text isEqualToString:@""]||[_addView.number.text isEqualToString:@""]||[_addView.country.text isEqualToString:@""]||[_addView.intro.text isEqualToString:@""]) {
        UIAlertController *omitAlert = [UIAlertController alertControllerWithTitle:@"信息不完整" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [omitAlert addAction:okAction];
        [self presentViewController:omitAlert animated:YES completion:nil];
    }
    else {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        //        self.animationMOC = appDelegate.persistentContainer.viewContext;
        self.animation.name = _addView.name.text;
        self.animation.time = _addView.time.text;
        self.animation.number = _addView.number.text;
        self.animation.country = _addView.country.text;
        self.animation.intro = _addView.intro.text;
        NSData *imageData = UIImagePNGRepresentation(_addView.imageView.image);
        self.animation.image = imageData;
        self.animation.follow = _addView.like.on;

        [appDelegate saveContext];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didClickDelete {
    [self.appDelegate.persistentContainer.viewContext deleteObject:self.animation];
    [self.navigationController popViewControllerAnimated:YES];
//    [self.delegate didClickDelete];
}

- (void)didClickImage {
    NSLog(@"click");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    _addView.imageView.image = photo;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (AppDelegate *)appDelegate {
    if(_appDelegate == nil) {
        _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return _appDelegate;
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
