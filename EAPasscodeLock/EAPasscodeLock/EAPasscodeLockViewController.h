//
//  EAPasscodeLockViewController.h
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "EAPasscodeLockProtocol.h"

@interface EAPasscodeLockViewController : UIViewController
{
    IBOutlet UIImageView* passcodeImage;
    IBOutlet UIButton* deleteKey;
    IBOutlet UIButton* cancelKey;
    IBOutlet UIButton* hintKey;
    IBOutlet UIButton* key0;
    IBOutlet UIButton* key1;
    IBOutlet UIButton* key2;
    IBOutlet UIButton* key3;
    IBOutlet UIButton* key4;
    IBOutlet UIButton* key5;
    IBOutlet UIButton* key6;
    IBOutlet UIButton* key7;
    IBOutlet UIButton* key8;
    IBOutlet UIButton* key9;   
    
    IBOutlet UIImageView* firstDigit;
    IBOutlet UIImageView* secondDigit;
    IBOutlet UIImageView* thirdDigit;
    IBOutlet UIImageView* fourthDigit;    
    
    IBOutlet UIView* passcodeErrorBaseView;
    IBOutlet UILabel* passcodeErrorLabel;
    IBOutlet UILabel* passcodeErrorTryAgain;
    
    int digitPosition;
    BOOL keyIsBeenPressed;
    
    NSMutableDictionary* passcodeDic;
    
    NSString* unlockCode;
    
    id<EAPasscodeLockProtocol> passcodeDelegate; 
    
    int tries;
    int maxRetries;
    BOOL showHint;
    BOOL showCancel;
    
    NSString* passcodeTitle;
    NSString* hintText;
}
@property (nonatomic, retain) NSString* hintText;
@property (nonatomic, retain) NSString* passcodeTitle;
@property (nonatomic, retain) IBOutlet UIView* passcodeErrorBaseView;
@property (nonatomic, retain) IBOutlet UILabel* passcodeErrorLabel;
@property (nonatomic, retain) IBOutlet UILabel* passcodeErrorTryAgain; 

@property (nonatomic) id<EAPasscodeLockProtocol> passcodeDelegate;

@property (nonatomic, retain) NSMutableDictionary* passcodeDic;
@property (nonatomic, retain) NSString* unlockCode;

@property (nonatomic, retain) IBOutlet UIImageView* firstDigit;
@property (nonatomic, retain) IBOutlet UIImageView* secondDigit;
@property (nonatomic, retain) IBOutlet UIImageView* thirdDigit;
@property (nonatomic, retain) IBOutlet UIImageView* fourthDigit;    

@property (nonatomic, retain) IBOutlet UIImageView* passcodeImage;
@property (nonatomic, retain) IBOutlet UIButton* deleteKey;
@property (nonatomic, retain) IBOutlet UIButton* cancelKey;
@property (nonatomic, retain) IBOutlet UIButton* hintKey;
@property (nonatomic, retain) IBOutlet UIButton* key0;
@property (nonatomic, retain) IBOutlet UIButton* key1;
@property (nonatomic, retain) IBOutlet UIButton* key2;
@property (nonatomic, retain) IBOutlet UIButton* key3;
@property (nonatomic, retain) IBOutlet UIButton* key4;
@property (nonatomic, retain) IBOutlet UIButton* key5;
@property (nonatomic, retain) IBOutlet UIButton* key6;
@property (nonatomic, retain) IBOutlet UIButton* key7;
@property (nonatomic, retain) IBOutlet UIButton* key8;
@property (nonatomic, retain) IBOutlet UIButton* key9;

-(IBAction)deleteKeyPressed:(id)sender;
-(IBAction)cancelKeyPressed:(id)sender;
-(IBAction)hintKeyPressed:(id)sender;

-(IBAction)keyPressed:(id)sender;

- (void)setMaxRetries:(int)retries;
- (void)setCancellable:(BOOL)canCancel;

//- (void) setPasscodeDelegate:(id<EAPasscodeLockProtocol>)_passcodeDelegate;

@end
