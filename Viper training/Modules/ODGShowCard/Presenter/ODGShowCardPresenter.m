//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import "ODGShowCardPresenter.h"
#import "ODGShowCardWireframe.h"

@implementation ODGShowCardPresenter

- (ODGCard *)requestCard {
    
    return self.cardToShow;
}

- (void)setCard:(ODGCard *)card {
    
    self.cardToShow = card;
}

@end