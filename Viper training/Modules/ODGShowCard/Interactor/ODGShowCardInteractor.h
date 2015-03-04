//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODGShowCardProtocols.h"


@interface ODGShowCardInteractor : NSObject <ODGShowCardInteractorInputProtocol>

@property (nonatomic, weak) id <ODGShowCardInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <ODGShowCardAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <ODGShowCardLocalDataManagerInputProtocol> localDataManager;

@end