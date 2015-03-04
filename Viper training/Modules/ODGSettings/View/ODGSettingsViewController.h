//
// Created by vipergen
//

@import UIKit;
#import "ODGSettingsProtocols.h"

@class ODGSettingsPresenter;

@interface ODGSettingsViewController : UITableViewController <ODGSettingsViewProtocol>

@property (nonatomic, strong) id <ODGSettingsPresenterProtocol> presenter;

@end
