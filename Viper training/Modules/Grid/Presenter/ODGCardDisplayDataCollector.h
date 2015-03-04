//
//  ODGCardDisplayDataCollector.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@class ODGCardDeck;

@interface ODGCardDisplayDataCollector : NSObject

- (void)addUpcomingItems:(NSArray*)upcomingItems;
- (ODGCardDeck*)collectedDisplayData;

@end
