//
// Created by vipergen
//

#import "ODGSettingsViewController.h"
#import "ODGSettingsPresenter.h"
#import "ODGDeck.h"

static NSString* const ODGSettingsCellIdentifier = @"ODGSettingsViewCell";
static NSString* const kSettingsViewControllerTitle = @"Decks";

@interface ODGSettingsViewController()

@property (nonatomic, strong)   NSArray* decks;

@end

@implementation ODGSettingsViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:ODGSettingsCellIdentifier bundle:nil] forCellReuseIdentifier:ODGSettingsCellIdentifier];
    [self addBackButton];
    self.navigationItem.title = @"Settings";
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.presenter updateView];
}

- (void)addBackButton {
    
    UIBarButtonItem *okButton = [[UIBarButtonItem alloc] initWithTitle:@"OK"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self.presenter
                                                                    action:@selector(requestClose)];
    self.navigationItem.rightBarButtonItem = okButton;
}

- (void)showDecks:(NSArray *)decks {
    
    self.decks = decks;
    [self.tableView reloadData];
}

- (void)reloadSettings {
    
    [self.presenter updateView];
}

#pragma mark - View protocol methods

/** PRESENTER -> VIEW methods */

#pragma mark - UITableViewDelegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.decks count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return kSettingsViewControllerTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ODGDeck *deck = self.decks[indexPath.row];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ODGSettingsCellIdentifier forIndexPath:indexPath];

    cell.textLabel.text = deck.name;
    cell.detailTextLabel.text = deck.text;
    if (deck.isSelected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ODGDeck *deck = self.decks[indexPath.row];
    [self.presenter deckWasSelected:deck.name];
}

@end