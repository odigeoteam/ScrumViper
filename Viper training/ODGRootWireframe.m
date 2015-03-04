//
//  ODGRootWireframe.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGRootWireframe.h"

@implementation ODGRootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window {
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [window setRootViewController:navigationController];
    [window makeKeyAndVisible];
}

@end
