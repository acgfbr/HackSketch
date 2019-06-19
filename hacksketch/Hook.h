//
//  sshack.h
//  sshack
//
//  Created by soh on 5/18/19.
//Copyright © 2019 Soh Satoh. All rights reserved.
//

#import "Headers.h"
#import <Foundation/Foundation.h>

@interface NSObject(BCLicenseManagerHook)
+ (void)hookBCLicenseManager;
@end

@interface NSObject(BCRegularLicenseHook)
+ (void)hookBCRegularLicense;
@end

@interface NSObject(AppControllerHook)
+ (void)hookAppController;
@end

@interface NSObject(MSLicenseRegistrationWindowControllerHook)
+ (void)hookMSLicenseRegistrationWindowController;
@end
