//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridPresenter.h"
#import "ODGCardGridWireframe.h"
#import "ODGCardDisplayDataCollector.h"

@implementation ODGCardGridPresenter

- (void)updateView {
    [self.interactor findCards];
}

- (void)requestShowSettings {
    [self.cardWireframe presentSettings];
}

- (void)foundUpcomingCards:(NSArray *)upcomingCards {
    
    if ([upcomingCards count] == 0) {
//        [self.userInterface showNoContentMessage];
    } else {
        [self updateUserInterfaceWithUpcomingItems:upcomingCards];
    }
}

- (void)updateUserInterfaceWithUpcomingItems:(NSArray *)upcomingItems {
    
    [self.userInterface showUpcomingDisplayData:[self upcomingDisplayDataWithItems:upcomingItems]];
}

- (ODGCardDeck *)upcomingDisplayDataWithItems:(NSArray *)upcomingItems {
    
    ODGCardDisplayDataCollector *collector = [[ODGCardDisplayDataCollector alloc] init];
    [collector addUpcomingItems:upcomingItems];
    
    return [collector collectedDisplayData];
}

- (void)showCardSelected:(ODGCard *)card {
    
    [self.cardWireframe presentShowCardInterfaceWithCard:card];
}

@end