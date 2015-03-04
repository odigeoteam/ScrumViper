//
// Created by vipergen
//

#import <Foundation/Foundation.h>

@class ODGCoreDataStore;

typedef void(^ODGSettingsDataManagerFetchEntriesBlock)(NSArray *entries);

@interface ODGSettingsDataManager : NSObject

@property (nonatomic, strong) ODGCoreDataStore *dataStore;

- (void)getDecksWithCompletionBlock:(void (^)(NSArray *decks))completionBlock;
- (void)markDeckAsSelected:(NSString *)deckNamed completionBlock:(void (^)(void))completionBlock;

@end