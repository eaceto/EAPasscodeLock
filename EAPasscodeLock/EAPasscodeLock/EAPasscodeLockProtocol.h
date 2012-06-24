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
-(void)passcodeDidUnlockedSuccessfully;

@optional
-(void)passcodeWillUnlockedSuccessfully;
-(void)passcodeFailedToUnlock;
-(void)passcodeLockWasCancelled;

@end
