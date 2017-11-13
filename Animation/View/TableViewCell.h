//
//  TableViewCell.h
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *cellImage;
@property (nonatomic, strong) UILabel *cellName;
@property (nonatomic, strong) UILabel *cellTime;
@property (nonatomic, strong) UILabel *cellNumber;

@end
