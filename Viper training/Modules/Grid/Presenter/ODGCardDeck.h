//
//  ODGCardDeck.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@interface ODGCardDeck : NSObject

@property (nonatomic, readonly, copy,) NSArray*    cards;

+ (instancetype)upcomingDisplayDataWithCards:(NSArray *)cards;

@end
