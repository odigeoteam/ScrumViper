//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODGShowCardProtocols.h"
#import "ODGCard.h"

@class ODGShowCardWireFrame;

@interface ODGShowCardPresenter : NSObject <ODGShowCardPresenterProtocol, ODGShowCardInteractorOutputProtocol>

- (void)setCard:(ODGCard *)card;

@property (nonatomic, strong) ODGCard *cardToShow;

@property (nonatomic, weak) id <ODGShowCardViewProtocol> view;
@property (nonatomic, strong) id <ODGShowCardInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <ODGShowCardWireFrameProtocol> wireFrame;

@property (nonatomic, weak) id<ODGShowCardModuleDelegate> showCardModuleDelegate;

@end
