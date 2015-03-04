//
//  ODGShowCardView.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import UIKit;

#import "ODGShowCardProtocols.h"

@interface ODGShowCardView : UIViewController <ODGShowCardViewProtocol>

@property (nonatomic, strong) id <ODGShowCardPresenterProtocol> presenter;

@end
