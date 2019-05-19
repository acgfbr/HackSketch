//
//  hackerss.m
//  hackerss
//
//  Created by soh on 5/18/19.
//Copyright © 2019 Soh Satoh. All rights reserved.
//

#import "hackSketch.h"

@interface hackSketch()

@end


@implementation hackSketch

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static hackSketch *plugin = nil;
    @synchronized(self) {
        if (!plugin) {
            plugin = [[self alloc] init];
        }
    }
    return plugin;
}


/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void)load
{
    hackSketch *plugin = [hackSketch sharedInstance];
    NSLog(@"++++++++ %@ plugin loaded ++++++++", plugin);
    [NSClassFromString(@"BCLicenseManager") hookBCLicenseManager];
    [NSClassFromString(@"BCRegularLicense") hookBCRegularLicense];
}
@end
