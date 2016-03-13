//
//  ViewController.m
//  iMoUDIDChangerApp
//
//  Created by iMokhles on 13/03/16.
//  Copyright © 2016 iMokhles. All rights reserved.
//

#import "ViewController.h"
#import "STPrivilegedTask.h" // was for personal use

@implementation ViewController

- (void)viewWillAppear {
    [super viewWillAppear];
    defaultUser = [NSUserDefaults standardUserDefaults];
    self.deviceNameLabel.stringValue = @"Device: ";
    [[MobileDeviceAccess singleton] setListener:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iMoUDIDChangerApp";
    // Do any additional setup after loading the view.
}

- (void)killAllTaskWithName:(NSString *)name
{
    NSArray *arguments = [NSArray arrayWithObjects:name, nil];
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:arguments];
    [task launch];
}

- (void)openAppWithName:(NSString *)name
{
    NSArray *arguments = [NSArray arrayWithObjects:[NSString stringWithFormat:@"/Applications/%@.app", name], nil];
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/open"];
    [task setArguments:arguments];
    [task launch];
}

#pragma mark - MobileDeviceAccessListener

/// This method will be called whenever a device is connected
- (void)deviceConnected:(AMDevice *)device {
    self.deviceNameLabel.stringValue = [NSString stringWithFormat:@"Device: %@", device.deviceName];
    self.oldUdidField.stringValue = [defaultUser objectForKey:@"origUDID"];
    
}
/// This method will be called whenever a device is disconnected
- (void)deviceDisconnected:(AMDevice *)device {
    self.deviceNameLabel.stringValue = @"Device: ";
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)applyTapped:(id)sender {
    [defaultUser setObject:self.deviceNameLabel.stringValue forKey:@"deviceName"];
    [defaultUser setObject:self.oldUdidField.stringValue forKey:@"origUDID"];
    [defaultUser setObject:self.udidField.stringValue forKey:@"newUDID"];
    [defaultUser synchronize];
    [self killAllTaskWithName:@"Xcode"];
    [self openAppWithName:@"Xcode"];
}
@end
