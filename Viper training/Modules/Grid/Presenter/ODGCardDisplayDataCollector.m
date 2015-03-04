//
//  ODGCardDisplayDataCollector.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardDisplayDataCollector.h"

#import "ODGCard.h"
#import "ODGCardDeck.h"

@interface ODGCardDisplayDataCollector()

@property (nonatomic, strong)   NSMutableArray *cards;

@end

@implementation ODGCardDisplayDataCollector

- (void)addUpcomingItems:(NSArray *)upcomingItems
{
    for (ODGCard *upcomingItem in upcomingItems)
    {
        [self.cards addObject:upcomingItem];
    }
}

- (ODGCardDeck *)collectedDisplayData {
    
    return [ODGCardDeck upcomingDisplayDataWithCards:self.cards];
}

- (NSMutableArray *)cards {
    
    if (_cards == nil)
    {
        _cards = [NSMutableArray new];
    }
    
    return _cards;
}

@end
