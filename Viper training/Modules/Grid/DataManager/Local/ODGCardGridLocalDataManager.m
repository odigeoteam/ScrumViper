//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridLocalDataManager.h"
#import "ODGCoreDataStore.h"
#import "NSArray+HOM.h"
#import "ODGCard.h"
#import "Deck.h"
#import "Deck+Deck_Extension.h"

@implementation ODGCardGridLocalDataManager

- (void)getCardsFromSelectedDeckWithCompletionBlock:(void (^)(NSArray *))completionBlock {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"deckSelected = YES"];
    
    __weak typeof(self) welf = self;
    [self.dataStore fetchEntries:[Deck entityName]
                       predicate:predicate
                 completionBlock:^(NSArray *entries) {
                     if ([entries count] > 0) {
                         completionBlock([welf cardsFromDataStoreDeck:entries[0]]);
                     }
                 }];
}

- (NSArray *)cardsFromDataStoreDeck:(Deck *)deck {
    
    NSArray *cards = [NSKeyedUnarchiver unarchiveObjectWithData:deck.cards];
    NSMutableArray *cardObjects = [[NSMutableArray alloc] init];
    for (NSString *card in cards) {
        [cardObjects addObject:[ODGCard cardWithValue:card]];
    }
    return cardObjects;
}

@end