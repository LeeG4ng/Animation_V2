//
//  TableViewCell.m
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 150, 100)];
        _cellImage.contentMode = UIViewContentModeScaleAspectFill;
        _cellImage.clipsToBounds = YES;
//        _cellImage.backgroundColor = [UIColor blueColor];
        [self addSubview:_cellImage];
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(170, 10, [[UIScreen mainScreen] bounds].size.width-180, 40)];
//        _cellName.backgroundColor = [UIColor greenColor];
        _cellName.font = [UIFont systemFontOfSize:24];
        _cellName.lineBreakMode = NSLineBreakByTruncatingTail;//省略结尾
        [self addSubview:_cellName];
        _cellTime = [[UILabel alloc] initWithFrame:CGRectMake(170, 50, [[UIScreen mainScreen] bounds].size.width-180, 30)];
//        _cellTime.backgroundColor = [UIColor redColor];
        _cellTime.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_cellTime];
        _cellNumber = [[UILabel alloc] initWithFrame:CGRectMake(170, 80, [[UIScreen mainScreen] bounds].size.width-180, 30)];
//        _cellNumber.backgroundColor = [UIColor yellowColor];
        _cellNumber.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_cellNumber];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
