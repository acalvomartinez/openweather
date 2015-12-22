//
//  ActualWeatherViewController.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherViewController.h"
#import "ActualWeatherTableManager.h"
#import "ActualWeather.h"

@interface ActualWeatherViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) ActualWeatherTableManager *tableManager;

@end

@implementation ActualWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonSetup];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.presenter updateView];
}

- (void)commonSetup {
    [self.presenter requestLocationServiceAuthorization];
    
    self.tableManager = [[ActualWeatherTableManager alloc] initWithViewController:self tableView:self.tableView];
}

- (IBAction)loadPressed:(id)sender {
    [self.presenter updateView];
}

- (void)updateViewWithActualWeather:(ActualWeather *)actualWeather {
    [self updateActualWeatherLabelsWith:actualWeather];
    
    [self.tableManager updateActualWeather:actualWeather];
}

- (void)updateViewWithForecast:(NSArray *)forecast {
    [self.tableManager updateForecast:forecast];
}

- (void)updateActualWeatherLabelsWith:(ActualWeather *)actualWeather {
    self.locationLabel.text = actualWeather.cityName;
    self.conditionLabel.text = actualWeather.weatherCondition;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%.2f", actualWeather.temperature];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%.2f", actualWeather.maxTemperature];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%.2f", actualWeather.minTemperature];
    self.dayLabel.text = [NSString stringWithFormat:@"%@", actualWeather.date];
}

@end
