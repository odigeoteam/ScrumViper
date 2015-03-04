//
//  ODGCoreDataStore.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import CoreData;

#import "ODGCoreDataStore.h"
#import "Deck.h"

@interface ODGCoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation ODGCoreDataStore

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"Viper-training.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }
    
    return self;
}

- (void)fetchEntries:(NSString *)entity
   completitionBlock:(ODGDataStoreFetchCompletionBlock)completionBlock {
    
    [self fetchEntries:entity predicate:nil completionBlock:completionBlock];
}

- (void)fetchEntries:(NSString *)entity
           predicate:(NSPredicate *)predicate
     completionBlock:(ODGDataStoreFetchCompletionBlock)completionBlock {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entity];
    [fetchRequest setPredicate:predicate];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (completionBlock) {
            completionBlock(results);
        }
    }];
}

- (void)unSelectAllDesks {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Deck"];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        for (Deck *deck in results) {
            deck.deckSelected = NO;
        }
        
        [self save];
    }];
}

- (Deck *)newDeck {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Deck"
                                                         inManagedObjectContext:self.managedObjectContext];
    Deck *newDeck = (Deck *)[[NSManagedObject alloc] initWithEntity:entityDescription
                                                                  insertIntoManagedObjectContext:self.managedObjectContext];
    
    return newDeck;
}

- (void)save {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (error != nil) {
        NSLog(@"Error saving...: %@", error);
    }
}

@end
