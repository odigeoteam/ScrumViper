//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import "ODGShowCardWireFrame.h"

@implementation ODGShowCardWireFrame

+ (void)presentODGShowCardModuleFrom:(UIViewController*)fromViewController card:(ODGCard *)card {
    
    // Generating module components
    id <ODGShowCardViewProtocol> view = [[ODGShowCardView alloc] init];
    ODGShowCardPresenter *presenter = [ODGShowCardPresenter new];
    id <ODGShowCardInteractorInputProtocol> interactor = [ODGShowCardInteractor new];
    id <ODGShowCardAPIDataManagerInputProtocol> APIDataManager = [ODGShowCardAPIDataManager new];
    id <ODGShowCardLocalDataManagerInputProtocol> localDataManager = [ODGShowCardLocalDataManager new];
    id <ODGShowCardWireFrameProtocol> wireFrame= [ODGShowCardWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    [presenter setCard:card];
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;
        
    [fromViewController.navigationController pushViewController:(UIViewController*)view animated:YES];
}

@end
