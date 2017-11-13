//
//  AddView.h
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextField *name;
@property (nonatomic, strong) UITextField *time;
@property (nonatomic, strong) UITextField *number;
@property (nonatomic, strong) UITextField *country;
@property (nonatomic, strong) UITextField *intro;
@property (nonatomic, strong) UISwitch *like;
@property (nonatomic, weak) id delegate;

@end
