//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

@protocol ODGShowCardInteractorOutputProtocol;
@protocol ODGShowCardInteractorInputProtocol;
@protocol ODGShowCardViewProtocol;
@protocol ODGShowCardPresenterProtocol;
@protocol ODGShowCardLocalDataManagerInputProtocol;
@protocol ODGShowCardAPIDataManagerInputProtocol;


@class ODGShowCardWireFrame;
@class ODGCard;

@protocol ODGShowCardModuleDelegate <NSObject>

//- (void)addModuleDidCancelAddAction;
//- (void)addModuleDidSaveAddAction;

@end

@protocol ODGShowCardViewProtocol
@required
@property (nonatomic, strong) id <ODGShowCardPresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
- (void)setCard:(ODGCard *)card;

@end

@protocol ODGShowCardWireFrameProtocol
@required
+ (void)presentODGShowCardModuleFrom:(id)fromView card:(ODGCard *)card;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol ODGShowCardPresenterProtocol
@required
@property (nonatomic, weak) id <ODGShowCardViewProtocol> view;
@property (nonatomic, strong) id <ODGShowCardInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <ODGShowCardWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
- (ODGCard *)requestCard;
- (void)setCard:(ODGCard *)card;

@end

@protocol ODGShowCardInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol ODGShowCardInteractorInputProtocol
@required
@property (nonatomic, weak) id <ODGShowCardInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <ODGShowCardAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <ODGShowCardLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol ODGShowCardDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol ODGShowCardAPIDataManagerInputProtocol <ODGShowCardDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol ODGShowCardLocalDataManagerInputProtocol <ODGShowCardDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end


