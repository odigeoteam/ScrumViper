//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

@protocol ODGCardGridInteractorOutputProtocol;
@protocol ODGCardGridInteractorInputProtocol;
@protocol ODGCardGridViewProtocol;
@protocol ODGCardGridPresenterProtocol;
@protocol ODGCardGridLocalDataManagerInputProtocol;
@protocol ODGCardGridAPIDataManagerInputProtocol;

@class ODGCardDeck;
@class ODGCard;

@class ODGCardGridWireFrame;


/** VIEW -> PRESENTER */

@protocol ODGCardGridPresenterProtocol
@required
- (void)updateView;
- (void)showCardSelected:(ODGCard *)card;
- (void)requestShowSettings;

@end

/** PRESENTER -> VIEW */

@protocol ODGCardGridInterface <NSObject>
@required
- (void)showUpcomingDisplayData:(ODGCardDeck *)data;
- (void)reloadEntries;

@end

/** INTERACTOR -> PRESENTER */

@protocol ODGCardGridInteractorOutputProtocol
@required
- (void)foundUpcomingCards:(NSArray *)upcomingCards;

@end

/** PRESENTER -> INTERACTOR */

@protocol ODGCardGridInteractorInputProtocol
@required
@property (nonatomic, weak) id <ODGCardGridInteractorOutputProtocol> presenter;

- (void)findCards;

@end

/** PRESENTER -> WIREFRAME */

@protocol ODGCardGridWireFrameProtocol
@required
+ (void)presentODGCardGridModuleFrom:(id)fromView;
@end

/** INTERACTOR -> LOCALDATAMANGER */

@protocol ODGCardGridLocalDataManagerInputProtocol
@required
- (void)getCardsFromSelectedDeckWithCompletionBlock:(void (^)(NSArray *decks))completionBlock;

@end


