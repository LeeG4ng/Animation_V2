//
//  Animation+CoreDataProperties.h
//  Animation
//
//  Created by Gary Lee on 2017/11/13.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//
//

#import "Animation+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Animation (CoreDataProperties)

+ (NSFetchRequest<Animation *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *intro;
@property (nonatomic) BOOL follow;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *number;
@property (nullable, nonatomic, copy) NSString *time;

@end

NS_ASSUME_NONNULL_END
