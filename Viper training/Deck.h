//
//  Deck.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Deck : NSManagedObject

@property (nonatomic, retain) NSData * cards;
@property (nonatomic) BOOL deckSelected;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * text;

@end
