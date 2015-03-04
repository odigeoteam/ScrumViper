//
// Created by vipergen
//

/** VIEW -> PRESENTER */
@protocol ODGSettingsPresenterProtocol

- (void)updateView;
- (void)requestClose;
- (void)deckWasSelected:(NSString *)deckNamed;

@end

/** PRESENTER -> VIEW */
@protocol ODGSettingsViewProtocol
@property (nonatomic, strong) id <ODGSettingsPresenterProtocol> presenter;

- (void)showDecks:(NSArray *)decks;
- (void)reloadSettings;

@end

/** PRESENTER -> INTERACTOR */
@protocol ODGSettingsInteractorInputProtocol

- (void)requestDecks;
- (void)markDeckAsSelect:(NSString *)deckNamed;

@end

/** INTERACTOR -> PRESENTER */
@protocol ODGSettingsInteractorOutputProtocol

- (void)foundDecks:(NSArray *)decks;
- (void)deckSelected;

@end
