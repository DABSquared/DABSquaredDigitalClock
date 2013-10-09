//
//  AnalogClockWithImagesViewController.m
//  AnalogClockWithImages
//
//  Created by DABSquared on 07/11/2013.
//  Copyright 2013 www.dabsquared.com. All rights reserved.
//

#import "DigitalClockViewController.h"
#import "DABSquaredDigitalClockView.h"

@interface DigitalClockViewController ()

@property (nonatomic, strong) DABSquaredDigitalClockView *clockView;

@end

@implementation DigitalClockViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  /*
   * 4 different looks at instantiating the view
   */
  [self instantiateClockAndAddImagesAfterAndDoNotStartAnimation];
  
  [self instantiateClockAndAddImagesAfterWithSomeImagesMissing];
  
  [self instantiateClockUsingADictionaryOfImages];
  
  [self instantiateClockUsingADictionaryOfImagesAndOptionsForControllingSecondHandAnimation];
  
}


- (void)instantiateClockAndAddImagesAfterAndDoNotStartAnimation
{
  DABSquaredDigitalClockView *analogClock = [[DABSquaredDigitalClockView alloc] initWithFrame:CGRectMake(220, 20, 80, 80)];
  
  [self.view addSubview:analogClock];
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateClock:)];
  [analogClock addGestureRecognizer:tap];
  
  self.clockView = analogClock;
  
  [analogClock updateClockTime];
}

- (void)updateClock:(id)sender
{
  [self.clockView updateClockTime];
}

- (void)instantiateClockAndAddImagesAfterWithSomeImagesMissing
{
  DABSquaredDigitalClockView *analogClock2 = [[DABSquaredDigitalClockView alloc] initWithFrame:CGRectMake(220, 138, 80, 80)];
  
  [self.view addSubview:analogClock2];
  
  [analogClock2 start];
}

- (void)instantiateClockUsingADictionaryOfImages
{  
  DABSquaredDigitalClockView *analogClock3 = [[DABSquaredDigitalClockView alloc] initWithFrame:CGRectMake(220, 246, 80, 80)];
  
  [self.view addSubview:analogClock3];
  
  [analogClock3 start];
}

- (void)instantiateClockUsingADictionaryOfImagesAndOptionsForControllingSecondHandAnimation
{
  DABSquaredDigitalClockView *analogClock4 = [[DABSquaredDigitalClockView alloc] initWithFrame:CGRectMake(220, 350, 80, 80) 
                                                                 withOptions:DABSquaredAnalogClockViewOptionShowTitle];
    [analogClock4 setClockTitle:@"hi"];
  [self.view addSubview:analogClock4];
  
  [analogClock4 start];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
