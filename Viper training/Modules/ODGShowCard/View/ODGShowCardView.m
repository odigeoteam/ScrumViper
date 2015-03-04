//
//  ODGShowCardView.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGShowCardView.h"
#import "ODGCardView.h"
#import "ODGCard.h"

#define DEGREES_TO_RADIANS(x) (M_PI * x / 180.0)

@interface ODGShowCardView ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *frontView;
@property (weak, nonatomic) IBOutlet UIView *panelView;

@property (weak, nonatomic) IBOutlet UILabel *cardNumberCenter;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberTop;
@property (weak, nonatomic) IBOutlet UILabel *smallNumberBottom;

@property (nonatomic) BOOL isCardFlipped;

@end

@implementation ODGShowCardView

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configureSubViews];
    [self.presenter requestCard];
    _isCardFlipped = NO;
}

- (void)setCard:(ODGCard *)card {
    
    [self setTextLabels:card.cardValue];
}

- (void)setTextLabels:(NSString *)value {
    
    self.smallNumberTop.text = value;
    self.smallNumberBottom.text = value;
    self.cardNumberCenter.text = value;
}

- (void)configureSubViews {
    
    [self configureSubView:self.backView];
    [self configureSubView:self.frontView];
    [self configureSubView:self.panelView];
    
    [self.smallNumberBottom setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180))];
}

- (void)configureSubView:(UIView *)subview {
    
    CGFloat borderWidth = 1.0f;
    
    subview.frame = CGRectInset(subview.frame, -borderWidth, -borderWidth);
    subview.layer.borderColor = [UIColor blackColor].CGColor;
    subview.layer.borderWidth = borderWidth;
    
    subview.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    subview.layer.shadowOffset = CGSizeMake(0, 2.0f);
    subview.layer.shadowRadius = 2.0f;
    subview.layer.shadowOpacity = 1.0f;
    subview.layer.masksToBounds = NO;
    subview.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:subview.bounds
                                                          cornerRadius:subview.layer.cornerRadius].CGPath;
}

- (IBAction)flipCard:(id)sender {
    
    [UIView transitionWithView:self.panelView
                      duration:0.5
                       options:(self.isCardFlipped ? UIViewAnimationOptionTransitionFlipFromRight :
                                UIViewAnimationOptionTransitionFlipFromLeft)
                    animations: ^{
                        if(self.isCardFlipped) {
                            self.frontView.hidden = true;
                            self.backView.hidden = false;
                        } else {
                            self.frontView.hidden = false;
                            self.backView.hidden = true;
                        }
                    }
     
                    completion:^(BOOL finished) {
                        if (finished) {
                            self.isCardFlipped = !self.isCardFlipped;
                        }
                    }];
}

@end