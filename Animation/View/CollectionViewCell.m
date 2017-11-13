//
//  CollectionViewCell.m
//  Animation
//
//  Created by Gary Lee on 2017/11/10.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-50)];
        _cellImage.backgroundColor = [UIColor clearColor];
        _cellImage.contentMode = UIViewContentModeScaleAspectFill;
        _cellImage.clipsToBounds = YES;
        [self.contentView addSubview:_cellImage];
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-50, frame.size.width, 30)];
        _cellName.backgroundColor = [UIColor clearColor];
        _cellName.font = [UIFont systemFontOfSize:22];
        _cellName.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_cellName];
        _cellTime = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-70, frame.size.width, 20)];
        _cellTime.backgroundColor = [UIColor clearColor];
        _cellTime.textColor = [UIColor whiteColor];
        _cellTime.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_cellTime];
        _cellNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        _cellNumber.backgroundColor = [UIColor clearColor];
        _cellNumber.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_cellNumber];
        
    }
    return self;
}

@end
