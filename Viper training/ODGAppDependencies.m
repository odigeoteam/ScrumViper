//
//  ODGAppDependencies.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGAppDependencies.h"

#import "ODGCoreDataStore.h"
#import "ODGRootWireframe.h"

#import "ODGCardGridLocalDataManager.h"
#import "ODGCardGridInteractor.h"
#import "ODGCardGridPresenter.h"
#import "ODGCardGridWireFrame.h"

#import "ODGShowCardLocalDataManager.h"
#import "ODGShowCardInteractor.h"
#import "ODGShowCardPresenter.h"
#import "ODGShowCardWireFrame.h"

#import "Deck.h"

#import "AppDelegate.h"

@interface ODGAppDependencies ()

@property (nonatomic, strong) ODGCardGridWireFrame *gridWireframe;

@end

@implementation ODGAppDependencies

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self configureDependencies];
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    
    [self.gridWireframe presentListInterfaceFromWindow:window];
}

- (void)configureDependencies {
    
    // Root Level Classes
    ODGCoreDataStore *dataStore = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).coreDataStore;
    ODGRootWireframe *rootWireframe = [[ODGRootWireframe alloc] init];

    // CardGrid Modules Classes
    ODGCardGridWireFrame *cardWireframe = [[ODGCardGridWireFrame alloc] init];
    ODGCardGridPresenter *cardPresenter = [[ODGCardGridPresenter alloc] init];
    ODGCardGridLocalDataManager *cardDataManager = [[ODGCardGridLocalDataManager alloc] init];
    ODGCardGridInteractor *cardInteractor = [[ODGCardGridInteractor alloc] init];

    // ShowCard Module Classes
    ODGShowCardWireFrame *showCardWireframe = [[ODGShowCardWireFrame alloc] init];
    ODGShowCardInteractor *showCardInteractor = [[ODGShowCardInteractor alloc] init];
    ODGShowCardPresenter *showCardPresenter = [[ODGShowCardPresenter alloc] init];
    ODGShowCardLocalDataManager *showCardDataManager = [[ODGShowCardLocalDataManager alloc] init];
    
    // CardGrip Module Classes
    cardInteractor.presenter = cardPresenter;
    cardInteractor.dataManager = cardDataManager;

    cardPresenter.interactor = cardInteractor;
    cardPresenter.cardWireframe = cardWireframe;

    cardWireframe.showCardWireframe = showCardWireframe;
    cardWireframe.cardGridPresenter = cardPresenter;
    cardWireframe.rootWireframe = rootWireframe;
    self.gridWireframe = cardWireframe;

    cardDataManager.dataStore = dataStore;

    // ShowCard Module Classes
    showCardInteractor.localDataManager = showCardDataManager;
    
    showCardPresenter.interactor = showCardInteractor;
    
    showCardPresenter.wireFrame = showCardWireframe;
    showCardPresenter.showCardModuleDelegate = cardPresenter;
}

@end
