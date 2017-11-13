//
//  AddViewController.m
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "AddViewController.h"
#import "AddView.h"
#import "AppDelegate.h"

#import "Animation+CoreDataClass.h"

@interface AddViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AddView *addView;
@property (nonatomic, strong) NSManagedObjectContext *animationMOC;
//@property(nonatomic, strong) UIManagedDocument *document;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"新增番剧";
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSave)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    _addView = [[AddView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_addView];
    _addView.delegate = self;

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
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        self.animationMOC = appDelegate.persistentContainer.viewContext;
        Animation *animation = [NSEntityDescription insertNewObjectForEntityForName:@"Animation" inManagedObjectContext:appDelegate.persistentContainer.viewContext];
        animation.name = _addView.name.text;
        animation.time = _addView.time.text;
        animation.number = _addView.number.text;
        animation.country = _addView.country.text;
        animation.intro = _addView.intro.text;
        NSData *imageData = UIImagePNGRepresentation(_addView.imageView.image);
        animation.image = imageData;
        animation.follow = _addView.like.on;

        [appDelegate saveContext];
        [self.navigationController popViewControllerAnimated:YES];
//        [self.delegate didClickSave];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
