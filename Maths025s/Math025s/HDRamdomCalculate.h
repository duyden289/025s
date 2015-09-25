//
//  HDRamdomCalculate.h
//  Math025s
//
//  Created by admin on 7/28/15.
//  Copyright (c) 2015 nguyenhuuden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDRamdomCalculate : NSObject

+ (instancetype)sharedInstance;
- (NSInteger)randomNumberA;
- (NSInteger)randomNumberB;
- (void)calculateRandom;
- (NSString *)stringCalculateByRandomCalculate;
- (void)calculateRandomRemoveSubaction;
@end
