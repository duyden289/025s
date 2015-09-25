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
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger timeCount;
@property (nonatomic, strong) NSString *resultOfCalculate;
@property (nonatomic) BOOL useInTheMiddleNumber;

@end

@implementation HDCalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALCULATE";
//    self.navigationItem.hidesBackButton = YES;
    [self checkSmallerWithSubaction];
    [self performCalculate];
    self.timeCount = 25;
    [self countDownTimer];
    
#warning TODO Perform Custom Back Home On Navigation
// Code here
    // Perform reset timer and set timeCount = 25;
    
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
        self.resultOfCalculate = [NSString stringWithFormat:@"%ld", (long)multiplicationCalculate];
    }
    else if ([stringCalculate isEqualToString:@"+"])
    {
        NSInteger summationCalculate= numberFirst + numberSecond;
        self.resultOfCalculate = [NSString stringWithFormat:@"%ld", (long)summationCalculate];
    }
    else if ([stringCalculate isEqualToString:@"-"])
    {
        NSInteger subactionCalculate = numberFirst - numberSecond;
        self.resultOfCalculate = [NSString stringWithFormat:@"%ld", (long)subactionCalculate];
    }
}

/**
 *  Perform count down timer
 */
- (void)countDownTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}


/**
 *  Update time
 */
- (void)updateTimer
{
    if (self.timeCount == 0) {
         NSLog(@"SAI ROI");
        [self.timer invalidate];
        self.timer = nil;
    }
    else
    {
        self.timeCount --;
        self.labelTime.text = [NSString stringWithFormat:@"%ld", (long)self.timeCount];
    }
}
/**
 *  Press number
 *
 *  @param sender button number
 */
- (IBAction)pressNumber:(UIButton *)sender {
    
    NSInteger number = (sender).tag;
    
    if (self.useInTheMiddleNumber) {
        self.resultCalculate.text = [self.resultCalculate.text stringByAppendingString:[NSString stringWithFormat:@"%ld", number]];
        
        NSArray *arraySlipt = [self.resultCalculate.text componentsSeparatedByString:@"0"];
        NSString *numberZero = arraySlipt[0];
        if ([numberZero isEqualToString:@""]) {
            
            self.resultCalculate.text = arraySlipt[1];
        }
    }
    
    else
    {
        self.resultCalculate.text = [NSString stringWithFormat:@"%ld",(long)number];
        self.useInTheMiddleNumber = YES;
    }
    
   
    
    if (self.timeCount != 0) {
        
        if ([self.resultCalculate.text isEqualToString:self.resultOfCalculate]) {
            
            NSLog(@"DUNG ROI");
            [self.timer invalidate];
        
        }
    }

}
/**
 *  Reset number
 *
 *  @param sender sender of button
 */
- (IBAction)resetNumber:(id)sender {
    
    self.resultCalculate.text = @"0";
    self.useInTheMiddleNumber = NO;
}





@end
