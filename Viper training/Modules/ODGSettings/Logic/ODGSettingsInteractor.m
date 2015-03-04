//
// Created by vipergen
//

#import "ODGSettingsInteractor.h"
#import "ODGSettingsDataManager.h"

@interface ODGSettingsInteractor()

@property (nonatomic, strong) ODGSettingsDataManager *dataManager;

@end

@implementation ODGSettingsInteractor

- (instancetype)initWithDataManager:(ODGSettingsDataManager *)dataManager {
    
    self = [super init];
    if (self) {
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)requestDecks {
    
    [self.dataManager getDecksWithCompletionBlock:^(NSArray *decks) {
        [self.output foundDecks:decks];
    }];
}

- (void)markDeckAsSelect:(NSString *)deckNamed {
    
    [self.dataManager markDeckAsSelected:deckNamed completionBlock:^{
        [self.output deckSelected];
    }];
}

#pragma mark - Interactor Input methods

/**
 * Implement interactor input protocol methods here
 * Make calls to output when needed
 */


#pragma mark - Private methods

/**
 * Implement this interactor private methods here
 */

@end