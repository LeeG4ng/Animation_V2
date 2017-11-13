//
//  AddView.m
//  Animation
//
//  Created by Gary Lee on 2017/11/7.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "AddView.h"

@implementation AddView


- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, 200)];
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.image = [UIImage imageNamed:@"origin"];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickImage)];
        [_imageView addGestureRecognizer:click];

        
        _name = [[UITextField alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y + _imageView.frame.size.height + 10, self.bounds.size.width, 45)];
        _name.enabled = YES;
        _name.borderStyle = UITextBorderStyleRoundedRect;
        _name.placeholder = @"番剧名";
        _name.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _time = [[UITextField alloc] initWithFrame:CGRectMake(0, _name.frame.origin.y + _name.frame.size.height + 10, self.bounds.size.width, 45)];
        _time.enabled = YES;
        _time.borderStyle = UITextBorderStyleRoundedRect;
        _time.placeholder = @"上映时间";
        _time.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _number = [[UITextField alloc] initWithFrame:CGRectMake(0, _time.frame.origin.y + _time.frame.size.height + 10, self.bounds.size.width, 45)];
        _number.enabled = YES;
        _number.borderStyle = UITextBorderStyleRoundedRect;
        _number.placeholder = @"集数";
        _number.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _country = [[UITextField alloc] initWithFrame:CGRectMake(0, _number.frame.origin.y + _number.frame.size.height + 10, self.bounds.size.width, 45)];
        _country.enabled = YES;
        _country.borderStyle = UITextBorderStyleRoundedRect;
        _country.placeholder = @"国家";
        _country.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _intro = [[UITextField alloc] initWithFrame:CGRectMake(0, _country.frame.origin.y + _country.frame.size.height + 10, self.bounds.size.width, 45)];
        _intro.enabled = YES;
        _intro.borderStyle = UITextBorderStyleRoundedRect;
        _intro.placeholder = @"简介";
        _intro.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        UITextField *likeText= [[UITextField alloc] initWithFrame:CGRectMake(0, _intro.frame.origin.y + _intro.frame.size.height + 10, self.bounds.size.width, 45)];
        likeText.enabled = NO;
        likeText.text = @"追番";
        likeText.borderStyle = UITextBorderStyleRoundedRect;
        _like = [[UISwitch alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-55, likeText.frame.origin.y + 7, 0, 0)];
        
        [self addSubview:_imageView];
        [self addSubview:_name];
        [self addSubview:_time];
        [self addSubview:_number];
        [self addSubview:_country];
        [self addSubview:_intro];
        [self addSubview:likeText];
        [self addSubview:_like];
    }
    return self;
}

- (void)didClickImage {
//    NSLog(@"click");
    [self.delegate didClickImage];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
