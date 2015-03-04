//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridInteractor.h"

@implementation ODGCardGridInteractor

- (void)findCards {
    
    [self.dataManager getCardsFromSelectedDeckWithCompletionBlock:^(NSArray *decks) {
        [self.presenter foundUpcomingCards:decks];
    }];
}

@end