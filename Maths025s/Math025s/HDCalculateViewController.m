//
//  ViewController.m
//  Math025s
//
//  Created by admin on 7/27/15.
//  Copyright (c) 2015 nguyenhuuden. All rights reserved.
//

#import "HDCalculateViewController.h"
#import "HDUtil.h"
#import "HDRamdomCalculate.h"

@interface HDCalculateViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonZero;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UILabel *calculation;
@property (weak, nonatomic) IBOutlet UILabel *numberOne;
@property (weak, nonatomic) IBOutlet UILabel *numberTwo;

@end

@implementation HDCalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALCULATE";
//    self.navigationItem.hidesBackButton = YES;
    [self checkSmallerWithSubaction];

    
}

-(void)randomCalculate
{
    [[HDRamdomCalculate sharedInstance] calculateRandom];
    
}

- (NSString *)calculateString
{
    return [[HDRamdomCalculate sharedInstance] stringCalculateByRandomCalculate];
}

- (void)checkSmallerWithSubaction
{
    NSInteger numberA = [[HDRamdomCalculate sharedInstance] randomNumberA];
    NSInteger numberB = [[HDRamdomCalculate sharedInstance] randomNumberB];
    if ([[self calculateString] isEqualToString:@"-"]) {
        
        if (numberA < numberB) {
            [[HDRamdomCalculate sharedInstance] calculateRandomRemoveSubaction];
        }
    }
    self.numberOne.text = [NSString stringWithFormat:@"%ld", (long)numberA];
    self.numberTwo.text = [NSString stringWithFormat:@"%ld", (long)numberB];
    self.calculation.text = [self calculateString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSUInteger)number:(HDNumber)numberCode
{
    NSUInteger numberSelect;
    
    switch (numberCode) {
        case HDNumberZero:
            numberSelect = 0;
            break;
        case HDNumberOne:
            numberSelect = 1;
            break;
        case HDNumberTwo:
            numberSelect = 2;
            break;
        case HDNUmberThree:
            numberSelect = 3;
            break;
        case HDNumberFour:
            numberSelect = 4;
            break;
        case HDNumberFive:
            numberSelect = 5;
            break;
        case HDNumberSix:
            numberSelect = 6;
            break;
        case HDNumberSeven:
            numberSelect = 7;
            break;
        case HDNumberEight:
            numberSelect = 8;
            break;
        case HDNumberNine:
            numberSelect = 9;
            break;
        case HDNumberTen:
            numberSelect = 10;
            break;
        
        default:
            break;
    }
    return numberSelect;
}

- (void)showAlertController : (NSString *)stringNumberCode
{
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Number Code" message:stringNumberCode preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//    }];
//    
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
//    
//    // Add Action to alert controller
//    [alertController addAction:ok];
//    [alertController addAction:cancel];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Number Code" message:stringNumberCode delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

- (IBAction)buttonZero:(id)sender {
    
    [self showAlertController:[NSString stringWithFormat:@"%ld", (long)HDNumberZero]];
    
}
- (IBAction)buttonOne:(id)sender {
    
    [self showAlertController:[NSString stringWithFormat:@"%ld", (long)HDNumberOne]];
}
- (IBAction)buttonTwo:(id)sender {
    
    [self showAlertController:[NSString stringWithFormat:@"%ld", (long)HDNumberTwo]];
}
- (IBAction)buttonThree:(id)sender {
    
    [self showAlertController:[NSString stringWithFormat:@"%ld", (long)HDNUmberThree]];
}
- (IBAction)buttonFour:(id)sender {
    
    [self showAlertController:[NSString stringWithFormat:@"%ld", (long)HDNumberFour]];
}



@end
