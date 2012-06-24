//
//  EAPasscodeLock.h
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAPasscodeLockViewController.h"

@interface EAPasscodeLock : NSObject

-(UIViewController*) passcodeViewControllerWithCancel:(BOOL)cancel andHint:(BOOL)hint;

@end
