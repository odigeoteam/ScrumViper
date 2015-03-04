//
//  ODGCardCollectionViewCell.m
//  Viper training
//
//  Created by Pablo Lerma on 26/01/15.
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardCollectionViewCell.h"
#import "ODGCardView.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0) 

static NSString * const ODGCardCellIdentifier = @"ODGCardCell";

@interface ODGCardCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cardNumberCenter;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberTop;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberBottom;

@end

@implementation ODGCardCollectionViewCell

- (void)awakeFromNib {
    [self configureCell];
}

- (void)setCardNumber:(NSString *)cardNumber {
    
    self.cardNumberCenter.text = cardNumber;
    self.smallNumberTop.text = cardNumber;
    self.smallNumberBottom.text = cardNumber;
}

+ (NSString *)cellIdentifier {
    return ODGCardCellIdentifier;
}

- (void)configureCell {
    
    self.contentView.layer.cornerRadius = 2.0f;
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    self.contentView.layer.masksToBounds = YES;
    
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
    
    [self.smallNumberBottom setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180))];
}

+ (CGSize)size {

    return CGSizeMake(130, 200);
}

@end
