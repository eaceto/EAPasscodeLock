//
//  EAAccessGrantedViewController.m
//  EAPasscodeLockTest
//
//  Created by Ezequiel Leonardo Aceto on 6/24/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import "EAAccessGrantedViewController.h"

@interface EAAccessGrantedViewController ()

@end

@implementation EAAccessGrantedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
}

@end
