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

#import "NSDate+Formatter.h"

@interface ActualWeatherViewController () <ActualWeatherTableManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (nonatomic, strong) ActualWeatherTableManager *tableManager;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottonTrailingConstrain;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
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
    
    self.tableManager = [[ActualWeatherTableManager alloc] initWithTableView:self.tableView andDelegate:self];
    
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
    self.temperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.temperature)];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.maxTemperature)];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.minTemperature)];
    self.dayLabel.text = [actualWeather.date dayOfTheWeek];
    
    self.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"background-%@", actualWeather.weatherIcon]];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark - TableViewManager Delegate

- (void)updateHeaderWithValue:(CGFloat)value {
    
    self.temperatureLabel.alpha = 1 - (value / 100);
    self.maxTemperatureLabel.alpha = 1 - (value / 100);
    self.minTemperatureLabel.alpha = 1 - (value / 100);
    self.dayLabel.alpha = 1 - (value / 100);
    
    self.bottonTrailingConstrain.constant = 10 + value;
    [self.view updateConstraints];
}

@end
