//
//  DetailViewController.h
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animation+CoreDataClass.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Animation *animation;
@property (nonatomic, weak) id delegate;

@end
