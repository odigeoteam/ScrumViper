//
//  ODGCardGridWireFrame.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridWireFrame.h"

#import "ODGCardListViewController.h"
#import "ODGCardGridPresenter.h"
#import "ODGRootWireframe.h"
#import "ODGShowCardWireFrame.h"
#import "ODGSettingsWireframe.h"

@interface ODGCardGridWireFrame ()

@property (nonatomic, strong) ODGCardListViewController *gridViewController;

@end

@implementation ODGCardGridWireFrame

- (void)presentListInterfaceFromWindow:(UIWindow *)window {
    
    ODGCardListViewController *gridViewController = [[ODGCardListViewController alloc] initWithNibName:@"ODGCardListViewController" bundle:nil];
    gridViewController.eventHandler = self.cardGridPresenter;
    self.cardGridPresenter.userInterface = gridViewController;
    self.gridViewController = gridViewController;
    
    [self.rootWireframe showRootViewController:gridViewController
                                      inWindow:window];
}

- (void)presentShowCardInterfaceWithCard:(id)card {
    
    [ODGShowCardWireFrame presentODGShowCardModuleFrom:self.gridViewController card:card];
}

- (void)presentSettings {
    
    ODGSettingsWireframe *settingsWireframe = [[ODGSettingsWireframe alloc] init];
    [settingsWireframe presentFromViewController:self.gridViewController];
}

@end
