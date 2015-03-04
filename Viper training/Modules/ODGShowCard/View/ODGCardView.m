//
//  ODGCardView.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardView.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface ODGCardView ()

@property (weak, nonatomic) IBOutlet UILabel *cardNumberCenter;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberTop;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberBottom;

@end

@implementation ODGCardView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self setupConstraints];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat borderWidth = 1.0f;
    
    self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth);
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = borderWidth;

    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    
    [self.smallNumberBottom setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180))];
}

- (void)setCardNumber:(NSString *)cardNumber {
    
    self.cardNumberCenter.text = cardNumber;
    self.smallNumberTop.text = cardNumber;
    self.smallNumberBottom.text = cardNumber;
}

//- (void)setupConstraints {
//    
//    // Width constraint
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
//                                                     attribute:NSLayoutAttributeWidth
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self.superview
//                                                     attribute:NSLayoutAttributeWidth
//                                                    multiplier:0.5
//                                                      constant:0]];
//    
//    // Height constraint
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
//                                                     attribute:NSLayoutAttributeHeight
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self.superview
//                                                     attribute:NSLayoutAttributeHeight
//                                                    multiplier:0.5
//                                                      constant:0]];
//    
//    // Center horizontally
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
//                                                     attribute:NSLayoutAttributeCenterX
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self.superview
//                                                     attribute:NSLayoutAttributeCenterX
//                                                    multiplier:1.0
//                                                      constant:0.0]];
//    
//    // Center vertically
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
//                                                     attribute:NSLayoutAttributeCenterY
//                                                     relatedBy:NSLayoutRelationEqual
//                                                        toItem:self.superview
//                                                     attribute:NSLayoutAttributeCenterY
//                                                    multiplier:1.0
//                                                      constant:0.0]];
//}

@end
