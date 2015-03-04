//
//  ODGCard.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCard.h"

@interface ODGCard()

@property (nonatomic, copy) NSString*   cardValue;

@end

@implementation ODGCard

+ (instancetype)cardWithValue:(NSString *)value {
    
    ODGCard *item = [[ODGCard alloc] init];
    
    item.cardValue = value;
    
    return item;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Card value:    %@", self.cardValue];
}


- (BOOL)isEqualToUpcomingDisplayItem:(ODGCard *)otherCard {
    
    if (!otherCard) {
        return NO;
    }
    
    BOOL hasEqualValues = [self.cardValue isEqualToString:otherCard.cardValue];
    
    return hasEqualValues;
}

- (BOOL)isEqual:(id)object {
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[ODGCard class]]) {
        return NO;
    }
    
    return [self isEqualToUpcomingDisplayItem:object];
}

- (NSUInteger)hash {
    
    return [self.cardValue hash];
}

@end
