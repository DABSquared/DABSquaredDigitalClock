//
//  DABSquaredAnalogClock.h
//  AnalogClockWithImages
//
//  Created by DABSquared on 07/11/2013.
//  Copyright 2013 www.dabsquared.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    DABSquaredDigitalClockViewOptionNone        = 1 << 0,
    DABSquaredDigitalClockViewOptionShowTitle = 1 << 1, // shows the Titlelabel
} DABSquaredDigitalClockViewOption;

@interface DABSquaredDigitalClockView : UIView

@property (nonatomic, strong) NSDate *clockTime;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) UILabel *clockTitleLabel, *clockLabel;
@property (nonatomic, strong) NSString *clockTitle;

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame withOptions:(DABSquaredDigitalClockViewOption)options;
- (void)start;
- (void)stop;
- (void)updateClockTime;
- (void)updateClockWithTime:(NSDate *)time;
- (void)setFormatString:(NSString *)formatString;
@end
