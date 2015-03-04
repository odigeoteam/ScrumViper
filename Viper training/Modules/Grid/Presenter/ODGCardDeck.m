//
//  ODGCardDeck.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardDeck.h"

@interface ODGCardDeck ()

@property (nonatomic, copy) NSArray*    cards;

@end

@implementation ODGCardDeck

+ (instancetype)upcomingDisplayDataWithCards:(NSArray *)cards {
    
    ODGCardDeck* data = [[ODGCardDeck alloc] init];
    
    data.cards = cards;
    
    return data;
}

- (BOOL)isEqualToUpcomingDisplayData:(ODGCardDeck *)data {
    
    if (!data) {
        return NO;
    }
    
    BOOL hasEqualSections = [self.cards isEqualToArray:data.cards];
    
    return hasEqualSections;
}

- (BOOL)isEqual:(id)object {
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[ODGCardDeck class]]) {
        return NO;
    }
    
    return [self isEqualToUpcomingDisplayData:object];
}

- (NSUInteger)hash {
    return [self.cards hash];
}

@end
