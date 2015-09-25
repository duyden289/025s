//
//  HDRamdomCalculate.m
//  Math025s
//
//  Created by admin on 7/28/15.
//  Copyright (c) 2015 nguyenhuuden. All rights reserved.
//

#import "HDRamdomCalculate.h"

NSString *const HDUseDefaultCalculate = @"HDUseDefaultCalculate";

@implementation HDRamdomCalculate

/**
 *  Singerton HD RanDomCalculate
 *
 *  @return hdRandomCalculate
 */
+ (instancetype)sharedInstance
{
    static HDRamdomCalculate *hdRandomCalculate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        hdRandomCalculate = [[HDRamdomCalculate alloc] init];
    
    });
    
    return hdRandomCalculate;
}

/**
 *  Random number first
 *
 *  @return number value of number first
 */
- (NSInteger)randomNumberFirst
{
    NSInteger numberA = arc4random_uniform(10);
    return numberA;
}

/**
 *  Random number second
 *
 *  @return number value of number second
 */
- (NSInteger)randomNumberSecond
{
    NSInteger numberB = arc4random_uniform(10);
    return numberB;
}

/**
 *  Random Calculate
 */
- (void)calculateRandom
{
    NSArray *arrayCalculate = [NSArray arrayWithObjects:
                               @"+",
                               @"-",
                               @"*",
                               nil];
    uint32_t randomCalculate = arc4random_uniform((int)[arrayCalculate count]);
    
    NSString *calculateString = [NSString stringWithFormat:@"%@", [arrayCalculate objectAtIndex:randomCalculate]];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:calculateString forKey:HDUseDefaultCalculate];
    [userDefault synchronize];
}

/**
 *  Random calculate with don't have subaction calculate
 */
- (void)calculateRandomRemoveSubaction
{
    NSArray *arrayCalculate = [NSArray arrayWithObjects:
                               @"+",
                               @"*",
                               nil];
    uint32_t randomCalculate = arc4random_uniform((int)[arrayCalculate count]);
    
    NSString *calculateString = [NSString stringWithFormat:@"%@", [arrayCalculate objectAtIndex:randomCalculate]];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:calculateString forKey:HDUseDefaultCalculate];
    [userDefault synchronize];
}

/**
 *  Save calculate
 *
 *  @return string of calculate
 */
- (NSString *)stringCalculateByRandomCalculate
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *calculateText = [userDefault objectForKey:HDUseDefaultCalculate];
    return calculateText;
}
@end
