//
//  AnalogClockWithImagesAppDelegate.h
//  AnalogClockWithImages
//
//  Created by DABSquared on 07/11/2013.
//  Copyright 2013 www.dabsquared.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DigitalClockViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet DigitalClockViewController *viewController;

@end
