//
//  ODGCardCollectionViewCell.h
//  Viper training
//
//  Created by Pablo Lerma on 26/01/15.
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@import UIKit;

@interface ODGCardCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *cardNumber;

+ (NSString *)cellIdentifier;
+ (CGSize)size;

@end
