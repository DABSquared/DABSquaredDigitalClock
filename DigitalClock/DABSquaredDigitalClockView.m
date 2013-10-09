//
//  DABSquaredAnalogClock.m
//  AnalogClockWithImages
//
//  Created by DABSquared on 07/11/2013.
//  Copyright 2013 www.dabsquared.com. All rights reserved.
//

#import "DABSquaredDigitalClockView.h"


@interface DABSquaredDigitalClockView ()

@property (nonatomic, strong) NSTimer *clockUpdateTimer;
@property (nonatomic, strong) NSString *formatString;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;


@property (nonatomic, assign) DABSquaredAnalogClockViewOption options;

@end

@implementation DABSquaredDigitalClockView

#pragma mark - Initializers

- (id)initWithFrame:(CGRect)frame
{
  return [self initWithFrame:frame withOptions:DABSquaredAnalogClockViewOptionNone];
}



- (id)initWithFrame:(CGRect)frame withOptions:(DABSquaredAnalogClockViewOption)options
{
  self = [super initWithFrame:frame];
  if (self) {
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    _options  = options;
      
    _formatString = @"hh:mm a";
      
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:_formatString];
      
    CGRect imageViewFrame;
    
    if (DABSquaredAnalogClockViewOptionShowTitle & self.options) {      
      _clockTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-15, frame.size.width, 15)];
      [_clockTitleLabel setBackgroundColor:[UIColor clearColor]];
      [_clockTitleLabel setTextAlignment:NSTextAlignmentCenter];
      [self addSubview:self.clockTitleLabel];
      imageViewFrame = CGRectMake(_clockTitleLabel.frame.size.height/2, 0, frame.size.width-_clockTitleLabel.frame.size.height, frame.size.height-_clockTitleLabel.frame.size.height);

    } else {
      imageViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
      
    _clockLabel = [[UILabel alloc] initWithFrame:imageViewFrame];
      [_clockLabel setBackgroundColor:[UIColor clearColor]];
      [_clockLabel setMinimumFontSize:5.0f];
      [_clockLabel setAdjustsFontSizeToFitWidth:YES];
      [self addSubview:self.clockLabel];
  }
  return self;
}



-(void)setClockTitle:(NSString *)clockTitle {
   _clockTitle = clockTitle;
   if (DABSquaredAnalogClockViewOptionShowTitle & self.options) {
     [self.clockTitleLabel setText:self.clockTitle];
   }
}

-(void)setClockTitleLabel:(UILabel *)clockTitleLabel {
    if(_clockTitleLabel) {
        [_clockTitleLabel removeFromSuperview];
    }
   _clockTitleLabel = clockTitleLabel;
  if (DABSquaredAnalogClockViewOptionShowTitle & self.options) {
    CGRect clockViewViewFrame = CGRectMake(_clockTitleLabel.frame.size.height/2, 0, self.frame.size.width-_clockTitleLabel.frame.size.height, self.frame.size.height-_clockTitleLabel.frame.size.height);
      [_clockTitleLabel setFrame:clockViewViewFrame];
      [_clockTitleLabel removeFromSuperview];
    [self addSubview:_clockTitleLabel];
  }
}

-(void)setClockLabel:(UILabel *)clockLabel {
    if(_clockLabel) {
        [_clockLabel removeFromSuperview];
    }
    _clockLabel = clockLabel;
    CGRect imageViewFrame;
    
    if (DABSquaredAnalogClockViewOptionShowTitle & self.options) {
        imageViewFrame = CGRectMake(_clockTitleLabel.frame.size.height/2, 0, self.frame.size.width-_clockTitleLabel.frame.size.height, self.frame.size.height-_clockTitleLabel.frame.size.height);
    } else {
        imageViewFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    
    [_clockLabel setFrame:imageViewFrame];
    
    [self addSubview:_clockLabel];
}

-(void)setFormatString:(NSString *)formatString {
    _formatString = formatString;
    [_dateFormatter setDateFormat:formatString];
}

#pragma mark - Start and Stop the clock

- (void)start
{
  if (self.clockUpdateTimer) {
    return;
  }
  
	self.clockUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                           target:self
                                                         selector:@selector(updateClockTime)
                                                         userInfo:nil
                                                          repeats:YES];
  [self updateClockTime];
}

- (void)stop
{
	[self.clockUpdateTimer invalidate]; self.clockUpdateTimer = nil;
}

- (void)updateClockWithTime:(NSDate *)time
{
  self.clockTime = time;
  
  void (^updateClocks)(void) = ^ {
     self.clockLabel.text = [self.dateFormatter stringFromDate:self.clockTime];
  };
  

    updateClocks();
  
}

- (void)updateClockTime
{
  self.clockTime = [NSDate date];
  
  void (^updateClocks)(void) = ^ {
      self.clockLabel.text = [self.dateFormatter stringFromDate:self.clockTime];
  };
  

    updateClocks();

}






@end
