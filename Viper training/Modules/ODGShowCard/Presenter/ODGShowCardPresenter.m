//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import "ODGShowCardPresenter.h"
#import "ODGShowCardWireframe.h"

@implementation ODGShowCardPresenter

- (void)requestCard {
    
    [self.view setCard:self.cardToShow];
}

- (void)setCard:(ODGCard *)card {
    
    self.cardToShow = card;
}

@end