//
//  AppDelegate.h
//  Animation
//
//  Created by Gary Lee on 2017/11/6.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

