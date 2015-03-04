//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridProtocols.h"
#import "ODGShowCardProtocols.h"

@class ODGCardGridWireFrame;

@interface ODGCardGridPresenter : NSObject <ODGCardGridPresenterProtocol, ODGCardGridInteractorOutputProtocol, ODGShowCardModuleDelegate>

@property (nonatomic, weak) id <ODGCardGridViewProtocol> view;
@property (nonatomic, strong) id <ODGCardGridInteractorInputProtocol> interactor;
@property (nonatomic, strong) ODGCardGridWireFrame *cardWireframe;

@property (nonatomic, strong) id <ODGCardGridInterface> userInterface;

@end
