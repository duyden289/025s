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

+ (instancetype)sharedInstance
{
    static HDRamdomCalculate *hdRandomCalculate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        hdRandomCalculate = [[HDRamdomCalculate alloc] init];
    
    });
    
    return hdRandomCalculate;
}

- (NSInteger)randomNumberA
{
    NSInteger numberA = arc4random_uniform(10);
    return numberA;
}

- (NSInteger)randomNumberB
{
    NSInteger numberB = arc4random_uniform(10);
    return numberB;
}

//- (BOOL)checkNumberAAndNumberB
//{
//    BOOL result = NO;
//    
//    if ([[self stringCalculateByRandomCalculate] isEqualToString:@"-"]) {
//        
//        NSInteger numberA = [self randomNumberA];
//        NSInteger numberB = [self randomNumberB];
//        if (numberA < numberB) {
//            
//            result = YES;
//        }
//    }
//    
//    return result;
//}


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

- (NSString *)stringCalculateByRandomCalculate
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *calculateText = [userDefault objectForKey:HDUseDefaultCalculate];
    return calculateText;
}
@end
