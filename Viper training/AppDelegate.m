//
//  AppDelegate.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

#import "AppDelegate.h"
#import "ODGAppDependencies.h"
#import "Deck.h"

@interface AppDelegate ()

@property (nonatomic, strong) ODGAppDependencies *dependencies;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.coreDataStore = [[ODGCoreDataStore alloc] init];
    [self fillCoreDataIfItIsFirstLaunch];

    ODGAppDependencies *dependencies = [[ODGAppDependencies alloc] init];
    self.dependencies = dependencies;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}




////
//
// Fill Core Data Temp
//
////
- (void)fillCoreDataIfItIsFirstLaunch {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if (![userDefaults objectForKey:@"firstRun"]) {
        [userDefaults setObject:[NSDate date] forKey:@"firstRun"];
        Deck *fibonacci = [self.coreDataStore newDeck];
        fibonacci.name = @"Fibonacci Sequence";
        fibonacci.text = @"0, 1, 2, 3, 5, 8, 13, 20, ...";
        fibonacci.cards = [NSKeyedArchiver archivedDataWithRootObject:@[@"0", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"100", @"?", @"∞"]];
        fibonacci.deckSelected = YES;
    
        Deck *sizes = [self.coreDataStore newDeck];
        sizes.name = @"Sizes";
        sizes.text = @"XXS, XS, S, M, L, XL, XXL";
        sizes.cards = [NSKeyedArchiver archivedDataWithRootObject:@[@"XXS", @"XS", @"S", @"M", @"L", @"XL", @"XXL"]];
        sizes.deckSelected = NO;
        
        Deck *powerOfTwo = [self.coreDataStore newDeck];
        powerOfTwo.name = @"Power of 2 series";
        powerOfTwo.text = @"1, 2, 4, 8, 16, 32, ...";
        powerOfTwo.cards = [NSKeyedArchiver archivedDataWithRootObject:@[@"1", @"2", @"4", @"8", @"16", @"32", @"64", @"128", @"256", @"512", @"1024"]];
        powerOfTwo.deckSelected = NO;
    
        [self.coreDataStore save];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
