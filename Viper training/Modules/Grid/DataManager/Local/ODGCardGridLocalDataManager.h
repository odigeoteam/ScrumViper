//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridProtocols.h"

@class ODGCoreDataStore;

@interface ODGCardGridLocalDataManager : NSObject <ODGCardGridLocalDataManagerInputProtocol>

@property (nonatomic, strong) ODGCoreDataStore *dataStore;

@end