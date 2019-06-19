//
//  sshack.m
//  sshack
//
//  Created by soh on 5/18/19.
//Copyright © 2019 Soh Satoh. All rights reserved.
//

#import "Hook.h"

@implementation NSObject(BCLicenseManagerHook)
+ (void)hookBCLicenseManager {
    NSError *error;
    [self jr_swizzleMethod:@selector(numberOfDaysLeftInTrialMode)
                withMethod:@selector(hook_numberOfDaysLeftInTrialMode)
                     error:&error];
    
    if (error) {
        NSLog(@"+++++ error: %@", error);
    }
}

-(long long)hook_numberOfDaysLeftInTrialMode {
    NSLog(@"++++++++ numberOfDaysLeftInTrialMode ++++++++");
    return 99999;
}
@end


@implementation NSObject(BCRegularLicenseHook)
+ (void)hookBCRegularLicense {
    NSError *error;
    [self jr_swizzleMethod:@selector(isValid)
                withMethod:@selector(hook_isValid)
                     error:&error];
    
    [self jr_swizzleMethod:@selector(isValid)
                withMethod:@selector(hook_isExpired)
                     error:&error];
    
    if (error) {
        NSLog(@"+++++ error: %@", error);
    }
}

-(char)hook_isValid {
    NSLog(@"++++++++ isValid ++++++++");
    return 1;
}

-(char)hook_isExpired {
    NSLog(@"++++++++ isExpired ++++++++");
    return 1;
}
@end


@implementation NSObject(AppControllerHook)
+ (void)hookAppController {
    NSError *error;
    [self jr_swizzleMethod:@selector(showLicenseAlert:remainingDays:)
                withMethod:@selector(hook_showLicenseAlert:remainingDays:)
                     error:&error];
    
    if (error) {
        NSLog(@"+++++ error: %@", error);
    }
}

-(void)hook_showLicenseAlert:arg1 remainingDays:arg2{
    NSLog(@"prevent to show alert - AppController");
}
@end

@implementation NSObject(MSLicenseRegistrationWindowControllerHook)
+ (void)hookMSLicenseRegistrationWindowController {
    NSError *error;
    [self jr_swizzleMethod:@selector(showTrialExpiredModal)
                withMethod:@selector(hook_showTrialExpiredModal)
                     error:&error];
    
    if (error) {
        NSLog(@"+++++ error: %@", error);
    }
}

-(void)hook_showTrialExpiredModal{
    NSLog(@"prevent to show alert - MSLicenseRegistrationWindowControllerHook");
}
@end
