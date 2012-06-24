//
//  EAPasscodeLock.h
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAPasscodeLockViewController.h"
#import "EAPasscodeLockProtocol.h"

@interface EAPasscodeLock : NSObject

// Cancellable = YES
// maxRetries = unlimited
// show Hint = NO
-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate;

// Cancellable = cancellable
// maxRetries = unlimited
// show Hint = NO
-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate;

// Cancellable = cancellable
// maxRetrires = retries
// show Hint only if hintText != nil and not Empty
-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable hintText:(NSString*)hintText maxRetries:(int)retries delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate;

@end
