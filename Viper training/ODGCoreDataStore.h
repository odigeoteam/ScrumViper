//
//  ODGCoreDataStore.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;

typedef void(^ODGDataStoreFetchCompletionBlock)(NSArray *results);

@interface ODGCoreDataStore : NSObject

- (void)fetchEntries:(NSString *)entity
   completitionBlock:(ODGDataStoreFetchCompletionBlock)completionBlock;

- (void)fetchEntries:(NSString *)entity
           predicate:(NSPredicate *)predicate
     completionBlock:(ODGDataStoreFetchCompletionBlock)completionBlock;

- (void)unSelectAllDesks;

- (Deck *)newDeck;

- (void)save;

@end
