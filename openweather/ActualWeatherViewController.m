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
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;

@property (weak, nonatomic) IBOutlet UIView *headerView;

@property (nonatomic, strong) ActualWeatherTableManager *tableManager;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottonTrailingConstrain;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) NSString *backgroundImageName;

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
    
    self.headerView.alpha = 0;
    self.tableView.alpha = 0;
    self.backgroundImageName = @"";
    self.backgroundImageView.alpha = 0;
}

- (IBAction)loadPressed:(id)sender {
    [self.presenter updateView];
}

- (void)updateActualWeatherViewsWith:(ActualWeather *)actualWeather {
    
    self.locationLabel.text = actualWeather.cityName;
    self.conditionLabel.text = actualWeather.weatherCondition;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.temperature)];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.maxTemperature)];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.minTemperature)];
    self.dayLabel.text = [actualWeather.date dayOfTheWeek];
    
    NSString *imageName = [NSString stringWithFormat:@"background-%@", actualWeather.weatherIcon];
    
    [self presentInterfaceWithBackgroundImage:imageName];
}

- (void)presentInterfaceWithBackgroundImage:(NSString *)imageName {
    if (![self.backgroundImageName isEqualToString:imageName]) {
        self.backgroundImageView.image = [UIImage imageNamed:imageName];
        
        [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.backgroundImageView.alpha = 1;
            self.headerView.alpha = 1;
            self.tableView.alpha = 1;
        } completion:^(BOOL finished) {
            self.backgroundImageName = imageName;
        }];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Public Interface

- (void)updateViewWithActualWeather:(ActualWeather *)actualWeather {
    if (actualWeather != nil) {
        [self updateActualWeatherViewsWith:actualWeather];
        
        [self.tableManager updateActualWeather:actualWeather];
    }
}

- (void)updateViewWithForecast:(NSArray *)forecast {
    if (forecast != nil) {
        [self.tableManager updateForecast:forecast];
    }
}

- (void)showError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Open Weather" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - TableViewManager Delegate

- (void)updateHeaderWithValue:(CGFloat)value {
    
    self.temperatureLabel.alpha = 1 - (value / 100);
    self.maxTemperatureLabel.alpha = 1 - (value / 100);
    self.minTemperatureLabel.alpha = 1 - (value / 100);
    self.dayLabel.alpha = 1 - (value / 100);
    self.degreeLabel.alpha = 1 - (value / 100);
    
    self.bottonTrailingConstrain.constant = 10 + value;
    [self.view updateConstraints];
}

@end
