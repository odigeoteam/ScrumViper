//
//  AppDelegate.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import UIKit;

#import "ODGCoreDataStore.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ODGCoreDataStore *coreDataStore;

@end

