//
// Created by vipergen
//

#import <Foundation/Foundation.h>
#import "ODGSettingsProtocols.h"

@class ODGSettingsDataManager;

@interface ODGSettingsInteractor : NSObject <ODGSettingsInteractorInputProtocol>

@property (nonatomic, weak) id <ODGSettingsInteractorOutputProtocol> output;

- (instancetype)initWithDataManager:(ODGSettingsDataManager *)dataManager;

@end