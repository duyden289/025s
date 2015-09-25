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
@property (weak, nonatomic) IBOutlet UILabel *resultCalculate;

@end

@implementation HDCalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALCULATE";
//    self.navigationItem.hidesBackButton = YES;
    [self checkSmallerWithSubaction];
    [self performCalculate];

    
}

/**
 *  Call function random calculate
 */
-(void)randomCalculate
{
    [[HDRamdomCalculate sharedInstance] calculateRandom];
    
}

/**
 *  Get string of random calculate
 *
 *  @return string random calculate
 */
- (NSString *)calculateString
{
    return [[HDRamdomCalculate sharedInstance] stringCalculateByRandomCalculate];
}

/**
 *  Check with subaction number first have smaller number second
 */
- (void)checkSmallerWithSubaction
{
    NSInteger numberFirst = [[HDRamdomCalculate sharedInstance] randomNumberFirst];
    NSInteger numberSecond = [[HDRamdomCalculate sharedInstance] randomNumberSecond];
    if ([[self calculateString] isEqualToString:@"-"]) {
        
        if (numberFirst < numberSecond) {
            
            [[HDRamdomCalculate sharedInstance] calculateRandomRemoveSubaction];
        }
    }
    self.numberOne.text = [NSString stringWithFormat:@"%ld", (long)numberFirst];
    self.numberTwo.text = [NSString stringWithFormat:@"%ld", (long)numberSecond];
    self.calculation.text = [self calculateString];
}

/**
 *  Perfomr calculate
 */
- (void)performCalculate
{
    NSString *stringCalculate = self.calculation.text;
    NSInteger numberFirst = [self.numberOne.text integerValue];
    NSInteger numberSecond = [self.numberTwo.text integerValue];
    
    if ([stringCalculate isEqualToString:@"*"]) {
        
        NSInteger multiplicationCalculate = numberFirst * numberSecond;
        self.resultCalculate.text = [NSString stringWithFormat:@"%ld", (long)multiplicationCalculate];
    }
    else if ([stringCalculate isEqualToString:@"+"])
    {
        NSInteger summationCalculate= numberFirst + numberSecond;
        self.resultCalculate.text = [NSString stringWithFormat:@"%ld", (long)summationCalculate];
    }
    else if ([stringCalculate isEqualToString:@"-"])
    {
        NSInteger subactionCalculate = numberFirst - numberSecond;
        self.resultCalculate.text = [NSString stringWithFormat:@"%ld", (long)subactionCalculate];
    }
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
