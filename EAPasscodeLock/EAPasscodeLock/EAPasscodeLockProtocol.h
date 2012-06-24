//
//  EAPasscodeDelegate.h
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/23/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EAPasscodeLockProtocol <NSObject>

@required
// Called when the passcode is entered correctly after dismissing the passcode View Controller
-(void)passcodeDidUnlockedSuccessfully;

@optional
// Called when the passcode is entered correctly before dismissing the passcode View Controller
-(void)passcodeWillUnlockedSuccessfully;
// Called when a passcode entered is incorrect
-(void)passcodeFailedToUnlock;
// Called when the cancel button was pressed and after the passcode View Controller is dismissed
-(void)passcodeLockWillBeCancelled;
// Called when the passcode was entered incorrectly too many times
-(void)passcodeFailedWithTooManyAttempts;
@end
