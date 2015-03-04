//
//  ODGSettingsPresenter.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODGSettingsProtocols.h"

@class ODGSettingsWireframe;

@interface ODGSettingsPresenter : NSObject <ODGSettingsPresenterProtocol, ODGSettingsInteractorOutputProtocol>

@property (nonatomic, weak) id <ODGSettingsViewProtocol> view;
@property (nonatomic, strong) id <ODGSettingsInteractorInputProtocol> interactor;
@property (nonatomic, strong) ODGSettingsWireframe *wireframe;

@end
