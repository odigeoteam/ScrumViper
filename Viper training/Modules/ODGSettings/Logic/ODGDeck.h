//
//  Deck.h
//  Viper training
//
//  Created by Pablo Lerma on 27/01/15.
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODGDeck : NSObject

@property (nonatomic, readonly, copy) NSString* name;
@property (nonatomic, readonly, copy) NSString* text;
@property (nonatomic, readonly) BOOL isSelected;

+ (instancetype)deckWithName:(NSString *)name
                        text:(NSString *)text
                    selected:(BOOL)selected;

@end
