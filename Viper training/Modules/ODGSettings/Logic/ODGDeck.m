//
//  ODGDeck.m
//  Viper training
//
//  Created by Pablo Lerma on 27/01/15.
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGDeck.h"

@interface ODGDeck()

@property (nonatomic, copy) NSString*   name;
@property (nonatomic, copy) NSString*   text;
@property (nonatomic) BOOL isSelected;

@end

@implementation ODGDeck

+ (instancetype)deckWithName:(NSString *)name text:(NSString *)text selected:(BOOL)selected {
    
    ODGDeck *deck = [[ODGDeck alloc] init];
    
    deck.name = name;
    deck.text = text;
    deck.isSelected = selected;
    
    return deck;
}

@end
