//
//  ActualWeatherViewController.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherViewController.h"

@interface ActualWeatherViewController ()

@end

@implementation ActualWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter requestLocationServiceAuthorization];
}


- (IBAction)loadPressed:(id)sender {
    [self.presenter updateView];
}

@end
