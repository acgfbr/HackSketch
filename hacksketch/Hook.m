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
