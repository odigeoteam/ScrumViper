//
//  ODGSettingsPresenter.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGSettingsPresenter.h"
#import "ODGSettingsWireframe.h"

@implementation ODGSettingsPresenter

#pragma mark - Presenter public methods

- (void)requestClose {
    [self.wireframe dismiss];
}

- (void)updateView {
    [self.interactor requestDecks];
}

- (void)deckWasSelected:(NSString *)deckNamed {
    [self.interactor markDeckAsSelect:deckNamed];
}

#pragma mark - Interactor Output methods

- (void)foundDecks:(NSArray *)decks {
    [self.view showDecks:decks];
}

- (void)deckSelected {
    [self.view reloadSettings];
}

@end