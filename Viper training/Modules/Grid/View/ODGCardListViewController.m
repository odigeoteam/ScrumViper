//
//  ODGCardListViewController.m
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "ODGCardListViewController.h"

#import "ODGCardDeck.h"
#import "ODGCard.h"

#import "ODGCardCollectionViewCell.h"

@interface ODGCardListViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)   ODGCardDeck *data;

// The view controller seems to have a weak reference to the table view.
// We need to keep a strong reference to the table view for times when we remove the table view from the view controller
@property (nonatomic, strong)   UICollectionView *strongCollectionView;

@end

@implementation ODGCardListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ODGCardCollectionViewCell" bundle:nil]
            forCellWithReuseIdentifier:[ODGCardCollectionViewCell cellIdentifier]];
    
    self.strongCollectionView = self.collectionView;
    [self configureView];
    [self addSettingsBarButton];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}

- (void)addSettingsBarButton {
    
    UIBarButtonItem *showSettings = [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self.eventHandler
                                                                    action:@selector(requestShowSettings)];
    self.navigationItem.rightBarButtonItem = showSettings;
}

- (void)configureView {
    
    self.navigationItem.title = @"Card List";
}

- (void)showUpcomingDisplayData:(ODGCardDeck *)data {
    
    self.view = self.strongCollectionView;
    
    self.data = data;
    [self reloadEntries];
}

- (void)reloadEntries {
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        
    return [self.data.cards count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        
    ODGCardCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:[ODGCardCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    ODGCard *cardNumber = self.data.cards[indexPath.row];
    cell.cardNumber = cardNumber.cardValue;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [ODGCardCollectionViewCell size];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20.0;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(25, 25, 10, 25);  // top, left, bottom, right
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Card selected: %@", self.data.cards[indexPath.row]);
    
    [self.eventHandler showCardSelected:self.data.cards[indexPath.row]];
}

@end
