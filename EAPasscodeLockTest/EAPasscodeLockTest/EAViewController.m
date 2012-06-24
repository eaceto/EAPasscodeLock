//
//  EAViewController.m
//  EAPasscodeLockTest
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import "EAViewController.h"

@interface EAViewController ()

@end

@implementation EAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    unlocked = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (unlocked == YES) 
    {        
        EAAccessGrantedViewController* granted = nil;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            granted = [[EAAccessGrantedViewController alloc] initWithNibName:@"EAAccessGrantedViewController_iPhone" bundle:nil];
        }
        else
        {
            granted = [[EAAccessGrantedViewController alloc] initWithNibName:@"EAAccessGrantedViewController_iPad" bundle:nil];
        }    
        [self presentModalViewController:granted animated:NO];        
    }
}

-(IBAction)unlock:(id)sender
{
    if (unlocked == NO)
    {
        EAPasscodeLock* passcodeManager = [[EAPasscodeLock alloc] init];
        UIViewController* plViewController = [passcodeManager passcodeViewControllerWithCode:@"1234" cancellable:YES hintText:@"Please enter a four digits number." maxRetries:4 delegate:self];
        
        [self presentModalViewController:plViewController animated:NO];        
    }    
}

-(void)passcodeDidUnlockedSuccessfully
{
    NSLog(@"Passcode Unlocked");
    unlocked = YES;
}

-(void)passcodeFailedWithTooManyAttempts
{
    NSLog(@"passcodeFailedWithTooManyAttempts");
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

@end
