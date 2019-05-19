//
//  PADProduct.h
//  sshack
//
//  Created by soh on 5/18/19.
//  Copyright © 2019 Soh Satoh. All rights reserved.
//

@interface BCLicenseManager
-(long long)numberOfDaysLeftInTrialMode;
@end

@interface BCRegularLicense
-(char)isValid;
-(char)isExpired;
@end
