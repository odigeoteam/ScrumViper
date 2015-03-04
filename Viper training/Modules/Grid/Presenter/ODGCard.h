//
//  ODGCard.h
//  Viper training
//
//  Copyright (c) 2015 Odigeo. All rights reserved.
//

@interface ODGCard : NSObject

@property (nonatomic, readonly, copy)   NSString*   cardValue;

+ (instancetype)cardWithValue:(NSString *)value;

@end
