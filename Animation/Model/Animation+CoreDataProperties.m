//
//  Animation+CoreDataProperties.m
//  Animation
//
//  Created by Gary Lee on 2017/11/13.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//
//

#import "Animation+CoreDataProperties.h"

@implementation Animation (CoreDataProperties)

+ (NSFetchRequest<Animation *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Animation"];
}

@dynamic country;
@dynamic image;
@dynamic intro;
@dynamic follow;
@dynamic name;
@dynamic number;
@dynamic time;

@end
