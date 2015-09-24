//
//  HDPlayViewController.m
//  Math025s
//
//  Created by admin on 7/28/15.
//  Copyright (c) 2015 nguyenhuuden. All rights reserved.
//

#import "HDPlayViewController.h"
#import "HDCalculateViewController.h"

NSString *const HDSegueIdentifierName = @"HDSegueIdentifier";
NSString *const HDStoryboardIdentifier = @"SBCalculateViewController";
NSString *const HDPostPlayName = @"PostPlayName";

@implementation HDPlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"PLAY";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callRandomCalculate) name:HDPostPlayName object:nil];
}

-(void)callRandomCalculate
{
    HDCalculateViewController *hdCalculate = [self.storyboard instantiateViewControllerWithIdentifier:HDStoryboardIdentifier];
    [hdCalculate randomCalculate];
}
- (IBAction)playMath:(id)sender {

    [self performSegueWithIdentifier:HDSegueIdentifierName sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:HDSegueIdentifierName]) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:HDPostPlayName object:nil];
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:HDPostPlayName object:nil];
}

@end
