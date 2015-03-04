//
// Created by vipergen
//

#import "ODGSettingsWireframe.h"
#import "ODGSettingsViewController.h"
#import "ODGSettingsInteractor.h"
#import "ODGSettingsPresenter.h"
#import "ODGSettingsWireframe.h"
#import "ODGSettingsDataManager.h"
#import "ODGCoreDataStore.h"

#import "AppDelegate.h"

@interface ODGSettingsWireframe()

@property (nonatomic, strong) UIViewController <ODGSettingsViewProtocol> *settingsViewController;

@end

@implementation ODGSettingsWireframe

- (id)init {
    self = [super init];
    if (self) {
        [self connectDependencies];
    }
    return self;
}

#pragma mark - Dependencies

- (void)connectDependencies {
    
    // Generating module components
    self.settingsViewController = [[ODGSettingsViewController alloc] init];
    ODGSettingsPresenter *presenter = [ODGSettingsPresenter new];
    ODGSettingsDataManager *dataManager = [[ODGSettingsDataManager alloc] init];
    dataManager.dataStore = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).coreDataStore;
    ODGSettingsInteractor *interactor = [[ODGSettingsInteractor alloc] initWithDataManager:dataManager];
    
    // Connecting
    self.settingsViewController.presenter = presenter;
    
    presenter.view = self.settingsViewController;
    presenter.wireframe = self;
    presenter.interactor = interactor;
    
    interactor.output = presenter;
}

- (void)disconnectDependencies {
    self.settingsViewController = nil;
}

#pragma mark - Present/Dismiss

- (void)presentFromViewController:(UIViewController *)viewController {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.settingsViewController];
    [viewController presentViewController:nav animated:YES completion:nil];
}

- (void)dismiss {
    
    [self.settingsViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
        [self disconnectDependencies];
    }];
}

@end
