//
//  ViewController.h
//  iMoUDIDChangerApp
//
//  Created by iMokhles on 13/03/16.
//  Copyright © 2016 iMokhles. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "MobileDeviceAccess.h"

@interface ViewController : NSViewController <MobileDeviceAccessListener> {
    NSUserDefaults *defaultUser;
}
@property (strong) IBOutlet NSTextField *deviceNameLabel;
@property (strong) IBOutlet NSTextField *oldUdidField;
@property (strong) IBOutlet NSTextField *udidField;
@property (strong) IBOutlet NSButton *applyButton;
- (IBAction)applyTapped:(id)sender;
@end

