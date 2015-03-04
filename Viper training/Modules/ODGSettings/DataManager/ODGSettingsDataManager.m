//
// Created by vipergen
//

#import "ODGSettingsDataManager.h"
#import "ODGCoreDataStore.h"
#import "NSArray+HOM.h"
#import "ODGDeck.h"
#import "Deck.h"
#import "Deck+Deck_Extension.h"

@implementation ODGSettingsDataManager

- (void)getDecksWithCompletionBlock:(void (^)(NSArray *))completionBlock {
        
    __weak typeof(self) welf = self;
    [self.dataStore fetchEntries:[Deck entityName]
               completitionBlock:^(NSArray *entries) {
                                  if ([entries count] > 0) {
                                      completionBlock([welf decksFromDataStoreEntries:entries]);
                                  }
                              }];
}

- (NSArray *)decksFromDataStoreEntries:(NSArray *)entries {
    
    return [entries arrayFromObjectsCollectedWithBlock:^id(Deck *deck) {

        return [ODGDeck deckWithName:deck.name text:deck.text selected:deck.deckSelected];
    }];
}

- (void)markDeckAsSelected:(NSString *)deckNamed completionBlock:(void (^)(void))completionBlock {
    
    [self.dataStore unSelectAllDesks];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", deckNamed];
    __weak typeof(self.dataStore) weakDataStore = self.dataStore;
    [self.dataStore fetchEntries:[Deck entityName]
                       predicate:predicate
                 completionBlock:^(NSArray *entries) {
                                  if ([entries count] > 0) {
                                      Deck *deck = entries[0];
                                      deck.deckSelected = YES;
                                      [weakDataStore save];
                                      completionBlock();
                                  }
                              }];
}

@end