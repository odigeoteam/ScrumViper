//
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardGridProtocols.h"

@class ODGCardGridLocalDataManager;

@interface ODGCardGridInteractor : NSObject <ODGCardGridInteractorInputProtocol>

@property (nonatomic, weak) id <ODGCardGridInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <ODGCardGridLocalDataManagerInputProtocol> dataManager;

@end