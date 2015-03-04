//
//  ODGCardListViewController.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import UIKit;
#import "ODGCardGridProtocols.h"

@interface ODGCardListViewController : UICollectionViewController <ODGCardGridInterface>

@property (nonatomic, strong) id <ODGCardGridPresenterProtocol> eventHandler;

@end
