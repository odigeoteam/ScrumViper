//
//  ODGCardGridWireFrame.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import UIKit;

@class ODGCardGridPresenter;
@class ODGRootWireframe;
@class ODGShowCardWireFrame;
@class ODGCard;

@interface ODGCardGridWireFrame : NSObject

@property (nonatomic, strong) ODGShowCardWireFrame *showCardWireframe;
@property (nonatomic, strong) ODGCardGridPresenter *cardGridPresenter;
@property (nonatomic, strong) ODGRootWireframe *rootWireframe;

- (void)presentListInterfaceFromWindow:(UIWindow *)window;
- (void)presentShowCardInterfaceWithCard:(ODGCard *)card;
- (void)presentSettings;

@end
