//
//  EAPasscodeLockViewController.m
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import "EAPasscodeLockViewController.h"

@interface EAPasscodeLockViewController ()

@end

@implementation EAPasscodeLockViewController
@synthesize passcodeImage;
@synthesize deleteKey,cancelKey,hintKey,key0,key1,key2,key3,key4,key5,key6,key7,key8,key9;
@synthesize firstDigit,secondDigit,thirdDigit,fourthDigit;
@synthesize passcodeDic;
@synthesize unlockCode;
@synthesize passcodeDelegate;
@synthesize passcodeErrorLabel,passcodeErrorBaseView,passcodeErrorTryAgain,passcodeTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // default unlock code
        unlockCode = @"0000";
    }
    return self;
}

- (void)setMaxRetries:(int)retries
{
    maxRetries = retries;
}

- (void)setShowHints:(BOOL)hint
{
    [hintKey setHidden:(hint == NO?YES:NO)];
}

- (void)setCancellable:(BOOL)canCancel
{
    [cancelKey setHidden:(canCancel == NO?YES:NO)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    passcodeDic = [[NSMutableDictionary alloc] initWithObjects:
                   [NSArray arrayWithObjects:@"",@"",@"",@"",nil] forKeys:[NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    firstDigit.hidden = YES;
    secondDigit.hidden = YES;
    thirdDigit.hidden = YES;
    fourthDigit.hidden = YES;    
    digitPosition = 0;
    [passcodeErrorBaseView setBackgroundColor:[UIColor clearColor]];
    passcodeErrorBaseView.hidden = YES;    
    
    /*
    key0.hidden = YES;
    key1.hidden = YES;
    key2.hidden = YES;
    key3.hidden = YES;
    key4.hidden = YES;
    key5.hidden = YES;
    key6.hidden = YES;
    key7.hidden = YES;
    key8.hidden = YES;
    key9.hidden = YES;
    cancelKey.hidden = YES;
    deleteKey.hidden = YES;    
    passcodeImage.hidden = YES;
    hintKey.hidden = YES;
    */
    // reset all statuses
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void)showError
{
    @autoreleasepool 
    {
        firstDigit.hidden = YES;
        secondDigit.hidden = YES;
        thirdDigit.hidden = YES;
        fourthDigit.hidden = YES;    
        digitPosition = 0;
        passcodeErrorBaseView.hidden = NO;
    }
}

-(IBAction)deleteKeyPressed:(id)sender
{
    if (digitPosition > 0)
    {
        switch (digitPosition) 
        {
            case 1: firstDigit.hidden = YES;           
                break;
            case 2: secondDigit.hidden = YES;              
                break;
            case 3: thirdDigit.hidden = YES;              
                break;
            case 4: fourthDigit.hidden = YES;            
                break;                
            default:
                return;
        }
        digitPosition--;
    }
}
-(IBAction)cancelKeyPressed:(id)sender
{
    firstDigit.hidden = YES;
    secondDigit.hidden = YES;
    thirdDigit.hidden = YES;
    fourthDigit.hidden = YES;   
    digitPosition = 0;
    if (passcodeDelegate != nil)
    {
        [passcodeDelegate passcodeLockWasCancelled];
    }
}
-(IBAction)hintKeyPressed:(id)sender
{
    NSLog(@"hintKeyPressed");
}

-(IBAction)keyPressed:(id)sender
{
    NSLog(@"keyPressed: %i",[sender tag]);
    switch (digitPosition) 
    {
        case 0: firstDigit.hidden = NO;
            break;
        case 1: secondDigit.hidden = NO;
            break;
        case 2: thirdDigit.hidden = NO;
            break;
        case 3: fourthDigit.hidden = NO;
            break;            
        default:
            return;
    }
    digitPosition++;
    [passcodeDic setObject:[NSString stringWithFormat:@"%i",[sender tag]] forKey:[NSString stringWithFormat:@"%i",digitPosition]];
    
    if (digitPosition >= 4)
    {
        @try
        {         
            NSString* code = [NSString stringWithFormat:@"%@%@%@%@",
                        [passcodeDic objectForKey:@"1"],
                        [passcodeDic objectForKey:@"2"],
                        [passcodeDic objectForKey:@"3"],
                        [passcodeDic objectForKey:@"4"]];
            if ([code compare:unlockCode] == NSOrderedSame)
            {
                if (passcodeDelegate != nil)
                {
                    if ([passcodeDelegate respondsToSelector:@selector(passcodeWillUnlockedSuccessfully)])
                    {
                        [passcodeDelegate passcodeWillUnlockedSuccessfully];
                    }
                    [self dismissModalViewControllerAnimated:YES];
                    [passcodeDelegate passcodeDidUnlockedSuccessfully];
                }
            }
            else 
            {
                if (passcodeDelegate != nil)
                {
                    if ([passcodeDelegate respondsToSelector:@selector(passcodeFailedToUnlock)])
                    {
                        [passcodeDelegate passcodeFailedToUnlock];
                    }
                }
                // unlock error
                [self performSelector:@selector(showError) withObject:self afterDelay:0.5];
            }
        }
        @catch (NSException* e) 
        {
    
        }
    }
}

@end
