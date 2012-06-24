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

-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancelable:(BOOL)cancelable showHint:(BOOL)hint maxRetries:(int)retries delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate;

@end
